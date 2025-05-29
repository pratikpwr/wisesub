import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../subscriptions/domain/entities/subscription.dart';
import '../entities/monthly_spending.dart';
import '../entities/payment_history.dart';

abstract class GeneralRepository {
  Future<Either<Failure, MonthlySpending>> getMonthlySpending(
    int month,
    int year,
  );

  Future<Either<Failure, List<PaymentHistory>>> getPaymentHistory({
    int limit = 10,
  });

  Future<Either<Failure, Subscription?>> getUpcomingSubscriptionRenewal();
}
