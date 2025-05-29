import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/subscription.dart';
import '../../domain/usecases/add_category.dart';
import '../../domain/usecases/add_subscription.dart';
import '../../domain/usecases/get_categories.dart';
import '../../domain/usecases/get_subscriptions.dart';
import 'subscription_event.dart';
import 'subscription_state.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final GetSubscriptions getSubscriptions;
  final GetCategories getCategories;
  final AddSubscription addSubscription;
  final AddCategory addCategory;

  SubscriptionBloc({
    required this.getSubscriptions,
    required this.getCategories,
    required this.addSubscription,
    required this.addCategory,
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

    // Reload categories if successful
    if (result.isRight()) {
      await _loadCategories(emit);
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
      updateSubscription: (subscription) async {
        // TODO: Implement update subscription
      },
      deleteSubscription: (id) async {
        // TODO: Implement delete subscription
      },
      updateCategory: (category) async {
        // TODO: Implement update category
      },
      deleteCategory: (id) async {
        // TODO: Implement delete category
      },
    );
  }
}
