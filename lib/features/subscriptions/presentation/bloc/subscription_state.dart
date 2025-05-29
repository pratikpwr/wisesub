import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/subscription.dart';

part 'subscription_state.freezed.dart';

@freezed
class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState.error(Failure failure) = _Error;
  const factory SubscriptionState.initial() = _Initial;
  const factory SubscriptionState.loaded({
    required List<Subscription> subscriptions,
    required List<Category> categories,
    String? selectedCategoryId,
  }) = _Loaded;
  const factory SubscriptionState.loading() = _Loading;
}
