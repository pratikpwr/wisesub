import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/subscription.dart';

part 'subscription_event.freezed.dart';

@freezed
class SubscriptionEvent with _$SubscriptionEvent {
  const factory SubscriptionEvent.addCategory(Category category) = _AddCategory;
  const factory SubscriptionEvent.addSubscription(Subscription subscription) =
      _AddSubscription;
  const factory SubscriptionEvent.deleteCategory(String id) = _DeleteCategory;
  const factory SubscriptionEvent.deleteSubscription(String id) =
      _DeleteSubscription;
  const factory SubscriptionEvent.filterByCategory(String? categoryId) =
      _FilterByCategory;
  const factory SubscriptionEvent.loadCategories() = _LoadCategories;
  const factory SubscriptionEvent.loadSubscriptions() = _LoadSubscriptions;
  const factory SubscriptionEvent.updateCategory(Category category) =
      _UpdateCategory;
  const factory SubscriptionEvent.updateSubscription(
    Subscription subscription,
  ) = _UpdateSubscription;
}
