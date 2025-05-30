import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/subscription.dart';
import '../../domain/usecases/add_category.dart';
import '../../domain/usecases/add_subscription.dart';
import '../../domain/usecases/delete_category.dart';
import '../../domain/usecases/delete_subscription.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_subscriptions.dart';
import '../../domain/usecases/update_category.dart';
import '../../domain/usecases/update_subscription.dart';
import 'subscription_event.dart';
import 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final GetSubscriptions getSubscriptions;
  final GetCategories getCategories;
  final AddSubscription addSubscription;
  final AddCategory addCategory;
  final DeleteSubscription deleteSubscription;
  final UpdateSubscription updateSubscription;
  final UpdateCategory updateCategory;
  final DeleteCategory deleteCategory;

  SubscriptionBloc({
    required this.getSubscriptions,
    required this.getCategories,
    required this.addSubscription,
    required this.addCategory,
    required this.deleteSubscription,
    required this.updateSubscription,
    required this.updateCategory,
    required this.deleteCategory,
  }) : super(const SubscriptionState.initial()) {
    on<SubscriptionEvent>(_onSubscriptionEvent);
  }

  Future<void> _addCategory(
    Category category,
    Emitter<SubscriptionState> emit,
  ) async {
    final result = await addCategory(AddCategoryParams(category: category));

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (_) => null,
    );

    // Update subscriptions to set their categoryId if successful
    if (result.isRight()) {
      await state.whenOrNull(
        loaded: (subscriptions, categories, selectedCategoryId) async {
          // Update each subscription in the category to have the new categoryId
          for (final subscriptionId in category.subscriptionIds) {
            final subscription = subscriptions.firstWhere(
              (sub) => sub.id == subscriptionId,
              orElse: () => throw Exception('Subscription not found'),
            );

            final updatedSubscription = subscription.copyWith(
              categoryId: category.id,
            );

            await updateSubscription(
              UpdateSubscriptionParams(subscription: updatedSubscription),
            );
          }
        },
      );

      // Reload both categories and subscriptions to reflect changes
      await _loadSubscriptions(emit);
    }
  }

  Future<void> _addSubscription(
    Subscription subscription,
    Emitter<SubscriptionState> emit,
  ) async {
    final result = await addSubscription(
      AddSubscriptionParams(subscription: subscription),
    );

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (_) => null,
    );

    // Reload subscriptions if successful
    if (result.isRight()) {
      await _loadSubscriptions(emit);
    }
  }

  Future<void> _deleteCategory(
    String id,
    Emitter<SubscriptionState> emit,
  ) async {
    // Before deleting, reset subscriptions in this category to default category
    await state.whenOrNull(
      loaded: (subscriptions, categories, selectedCategoryId) async {
        final categoryToDelete = categories.firstWhere(
          (cat) => cat.id == id,
          orElse: () => Category(
            id: id,
            name: '',
            subscriptionIds: [],
            createdAt: DateTime.now(),
          ),
        );

        // Reset all subscriptions in this category to default category
        for (final subscriptionId in categoryToDelete.subscriptionIds) {
          final subscription = subscriptions.firstWhere(
            (sub) => sub.id == subscriptionId,
            orElse: () => throw Exception('Subscription not found'),
          );

          final updatedSubscription = subscription.copyWith(
            categoryId: 'default_entertainment', // Reset to default category
          );

          await updateSubscription(
            UpdateSubscriptionParams(subscription: updatedSubscription),
          );
        }
      },
    );

    final result = await deleteCategory(DeleteCategoryParams(id: id));

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (_) => null,
    );

    // Reload both categories and subscriptions if successful
    if (result.isRight()) {
      await _loadSubscriptions(emit);
    }
  }

  Future<void> _deleteSubscription(
    String id,
    Emitter<SubscriptionState> emit,
  ) async {
    final result = await deleteSubscription(DeleteSubscriptionParams(id: id));

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (_) => null,
    );

    // Reload subscriptions if successful to refresh the list
    if (result.isRight()) {
      await _loadSubscriptions(emit);
    }
  }

  void _filterByCategory(String? categoryId, Emitter<SubscriptionState> emit) {
    state.whenOrNull(
      loaded: (subscriptions, categories, _) {
        emit(
          SubscriptionState.loaded(
            subscriptions: subscriptions,
            categories: categories,
            selectedCategoryId: categoryId,
          ),
        );
      },
    );
  }

  Future<void> _loadCategories(Emitter<SubscriptionState> emit) async {
    await state.whenOrNull(
      loaded: (subscriptions, categories, selectedCategoryId) async {
        final categoriesResult = await getCategories(NoParams());
        categoriesResult.fold(
          (failure) => emit(SubscriptionState.error(failure)),
          (newCategories) => emit(
            SubscriptionState.loaded(
              subscriptions: subscriptions,
              categories: newCategories,
              selectedCategoryId: selectedCategoryId,
            ),
          ),
        );
      },
    );
  }

  Future<void> _loadSubscriptions(Emitter<SubscriptionState> emit) async {
    emit(const SubscriptionState.loading());

    final subscriptionsResult = await getSubscriptions(NoParams());
    final categoriesResult = await getCategories(NoParams());

    subscriptionsResult.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (subscriptions) {
        categoriesResult.fold(
          (failure) => emit(SubscriptionState.error(failure)),
          (categories) => emit(
            SubscriptionState.loaded(
              subscriptions: subscriptions,
              categories: categories,
            ),
          ),
        );
      },
    );
  }

  Future<void> _onSubscriptionEvent(
    SubscriptionEvent event,
    Emitter<SubscriptionState> emit,
  ) async {
    await event.when(
      loadSubscriptions: () async => await _loadSubscriptions(emit),
      loadCategories: () async => await _loadCategories(emit),
      addSubscription: (subscription) async =>
          await _addSubscription(subscription, emit),
      addCategory: (category) async => await _addCategory(category, emit),
      filterByCategory: (categoryId) async {
        _filterByCategory(categoryId, emit);
      },
      updateSubscription: (subscription) async =>
          await _updateSubscription(subscription, emit),
      deleteSubscription: (id) async => await _deleteSubscription(id, emit),
      updateCategory: (category) async => await _updateCategory(category, emit),
      deleteCategory: (id) async => await _deleteCategory(id, emit),
    );
  }

  Future<void> _updateCategory(
    Category category,
    Emitter<SubscriptionState> emit,
  ) async {
    final result = await updateCategory(
      UpdateCategoryParams(category: category),
    );

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (_) => null,
    );

    // Update subscriptions to reflect category changes if successful
    if (result.isRight()) {
      await state.whenOrNull(
        loaded: (subscriptions, categories, selectedCategoryId) async {
          // First, remove categoryId from subscriptions that are no longer in this category
          final oldCategory = categories.firstWhere(
            (cat) => cat.id == category.id,
            orElse: () => Category(
              id: category.id,
              name: '',
              subscriptionIds: [],
              createdAt: DateTime.now(),
            ),
          );

          // Remove categoryId from subscriptions that were removed from category
          for (final oldSubscriptionId in oldCategory.subscriptionIds) {
            if (!category.subscriptionIds.contains(oldSubscriptionId)) {
              final subscription = subscriptions.firstWhere(
                (sub) => sub.id == oldSubscriptionId,
                orElse: () => throw Exception('Subscription not found'),
              );

              final updatedSubscription = subscription.copyWith(
                categoryId:
                    'default_entertainment', // Reset to default category
              );

              await updateSubscription(
                UpdateSubscriptionParams(subscription: updatedSubscription),
              );
            }
          }

          // Set categoryId for new subscriptions added to this category
          for (final subscriptionId in category.subscriptionIds) {
            final subscription = subscriptions.firstWhere(
              (sub) => sub.id == subscriptionId,
              orElse: () => throw Exception('Subscription not found'),
            );

            if (subscription.categoryId != category.id) {
              final updatedSubscription = subscription.copyWith(
                categoryId: category.id,
              );

              await updateSubscription(
                UpdateSubscriptionParams(subscription: updatedSubscription),
              );
            }
          }
        },
      );

      // Reload both categories and subscriptions to reflect changes
      await _loadSubscriptions(emit);
    }
  }

  Future<void> _updateSubscription(
    Subscription subscription,
    Emitter<SubscriptionState> emit,
  ) async {
    final result = await updateSubscription(
      UpdateSubscriptionParams(subscription: subscription),
    );

    result.fold(
      (failure) => emit(SubscriptionState.error(failure)),
      (_) => null,
    );

    // Reload subscriptions if successful
    if (result.isRight()) {
      await _loadSubscriptions(emit);
    }
  }
}
