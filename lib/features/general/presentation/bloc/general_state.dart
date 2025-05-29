import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../../subscriptions/domain/entities/subscription.dart';
import '../../domain/entities/monthly_spending.dart';
import '../../domain/entities/payment_history.dart';

part 'general_state.freezed.dart';

@freezed
class GeneralState with _$GeneralState {
  const factory GeneralState.error(Failure failure) = _Error;

  const factory GeneralState.initial() = _Initial;

  const factory GeneralState.loaded({
    required MonthlySpending monthlySpending,
    required Subscription? upcomingSubscription,
    required List<PaymentHistory> paymentHistory,
  }) = _Loaded;

  const factory GeneralState.loading() = _Loading;
}
