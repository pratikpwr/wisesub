import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../subscriptions/domain/entities/subscription.dart';
import '../../../subscriptions/domain/repositories/subscription_repository.dart';
import '../../domain/entities/monthly_spending.dart';
import '../../domain/entities/payment_history.dart';
import '../../domain/repositories/general_repository.dart';

class GeneralRepositoryImpl implements GeneralRepository {
  final SubscriptionRepository subscriptionRepository;

  const GeneralRepositoryImpl(this.subscriptionRepository);

  @override
  Future<Either<Failure, MonthlySpending>> getMonthlySpending(
    int month,
    int year,
  ) async {
    try {
      final subscriptionsResult = await subscriptionRepository
          .getSubscriptions();

      return subscriptionsResult.fold((failure) => Left(failure), (
        subscriptions,
      ) {
        final currentTotal = _calculateMonthlySpending(subscriptions);
        final previousMonthTotal = _calculatePreviousMonthSpending(
          subscriptions,
        );
        final percentageChange = _calculatePercentageChange(
          previousMonthTotal,
          currentTotal,
        );

        final monthlySpending = MonthlySpending(
          totalAmount: currentTotal,
          month: month,
          year: year,
          percentageChange: percentageChange,
        );

        return Right(monthlySpending);
      });
    } catch (e) {
      return const Left(ServerFailure('Failed to calculate monthly spending'));
    }
  }

  @override
  Future<Either<Failure, List<PaymentHistory>>> getPaymentHistory({
    int limit = 10,
  }) async {
    try {
      final subscriptionsResult = await subscriptionRepository
          .getSubscriptions();

      return subscriptionsResult.fold((failure) => Left(failure), (
        subscriptions,
      ) {
        final paymentHistory = _generatePaymentHistory(subscriptions, limit);
        return Right(paymentHistory);
      });
    } catch (e) {
      return const Left(ServerFailure('Failed to get payment history'));
    }
  }

  @override
  Future<Either<Failure, Subscription?>>
  getUpcomingSubscriptionRenewal() async {
    try {
      final subscriptionsResult = await subscriptionRepository
          .getSubscriptions();

      return subscriptionsResult.fold((failure) => Left(failure), (
        subscriptions,
      ) {
        final upcomingSubscription = _getNextUpcomingSubscription(
          subscriptions,
        );
        return Right(upcomingSubscription);
      });
    } catch (e) {
      return const Left(
        ServerFailure('Failed to get upcoming subscription renewal'),
      );
    }
  }

  double _calculateMonthlySpending(List<Subscription> subscriptions) {
    return subscriptions.fold(0.0, (total, subscription) {
      return total + subscription.monthlyPrice;
    });
  }

  double _calculatePercentageChange(double previous, double current) {
    if (previous == 0) return 0;
    return ((current - previous) / previous) * 100;
  }

  double _calculatePreviousMonthSpending(List<Subscription> subscriptions) {
    // For demo purposes, assume 95% of current spending
    final currentSpending = _calculateMonthlySpending(subscriptions);
    return currentSpending * 0.95;
  }

  List<PaymentHistory> _generatePaymentHistory(
    List<Subscription> subscriptions,
    int limit,
  ) {
    final history = <PaymentHistory>[];
    final now = DateTime.now();

    // Generate some mock payment history for the last 30 days
    for (final subscription in subscriptions) {
      // Add a few recent payments for each subscription
      for (int i = 1; i <= 3; i++) {
        final paymentDate = now.subtract(
          Duration(days: i * 7 + (subscriptions.indexOf(subscription) * 2)),
        );
        history.add(
          PaymentHistory(
            subscription: subscription,
            amount: subscription.price,
            date: paymentDate,
          ),
        );
      }
    }

    // Sort by date (most recent first)
    history.sort((a, b) => b.date.compareTo(a.date));

    return history.take(limit).toList();
  }

  DateTime _getNextPaymentDate(Subscription subscription) {
    final now = DateTime.now();
    final billingStartDate = subscription.billingStartDate;

    // Calculate next payment based on billing cycle and start date
    if (subscription.billingCycle == BillingCycle.monthly) {
      // For monthly subscriptions, find the next occurrence of the billing day
      var nextPayment = DateTime(now.year, now.month, billingStartDate.day);

      // If the payment day for this month has passed, move to next month
      if (nextPayment.isBefore(now) || nextPayment.isAtSameMomentAs(now)) {
        if (nextPayment.month == 12) {
          nextPayment = DateTime(nextPayment.year + 1, 1, billingStartDate.day);
        } else {
          nextPayment = DateTime(
            nextPayment.year,
            nextPayment.month + 1,
            billingStartDate.day,
          );
        }
      }

      return nextPayment;
    } else if (subscription.billingCycle == BillingCycle.yearly) {
      // For yearly subscriptions
      var nextPayment = DateTime(
        now.year,
        billingStartDate.month,
        billingStartDate.day,
      );

      // If this year's payment has passed, move to next year
      if (nextPayment.isBefore(now) || nextPayment.isAtSameMomentAs(now)) {
        nextPayment = DateTime(
          nextPayment.year + 1,
          billingStartDate.month,
          billingStartDate.day,
        );
      }

      return nextPayment;
    }

    // Default fallback
    return now.add(const Duration(days: 30));
  }

  Subscription? _getNextUpcomingSubscription(List<Subscription> subscriptions) {
    if (subscriptions.isEmpty) return null;

    final now = DateTime.now();
    Subscription? nextSubscription;
    DateTime? earliestDate;

    for (final subscription in subscriptions) {
      final nextPaymentDate = _getNextPaymentDate(subscription);

      if (earliestDate == null || nextPaymentDate.isBefore(earliestDate)) {
        earliestDate = nextPaymentDate;
        nextSubscription = subscription;
      }
    }

    return nextSubscription;
  }
}
