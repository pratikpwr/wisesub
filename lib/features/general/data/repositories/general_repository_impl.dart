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
        final currentTotal = _calculateMonthlySpending(
          subscriptions,
          month,
          year,
        );
        final previousMonthTotal = _calculatePreviousMonthSpending(
          subscriptions,
          month,
          year,
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

  double _calculateMonthlySpending(
    List<Subscription> subscriptions,
    int month,
    int year,
  ) {
    double total = 0.0;
    for (final subscription in subscriptions) {
      final isActive = _isSubscriptionActiveInMonth(subscription, month, year);

      if (isActive) {
        total += subscription.monthlyPrice;
      }
    }

    return total;
  }

  double _calculatePercentageChange(double previous, double current) {
    if (previous == 0) return 0;
    return ((current - previous) / previous) * 100;
  }

  double _calculatePreviousMonthSpending(
    List<Subscription> subscriptions,
    int month,
    int year,
  ) {
    // Calculate previous month
    int previousMonth = month - 1;
    int previousYear = year;

    if (previousMonth == 0) {
      previousMonth = 12;
      previousYear = year - 1;
    }

    return _calculateMonthlySpending(
      subscriptions,
      previousMonth,
      previousYear,
    );
  }

  List<PaymentHistory> _generatePaymentHistory(
    List<Subscription> subscriptions,
    int limit,
  ) {
    final history = <PaymentHistory>[];
    final now = DateTime.now();

    for (final subscription in subscriptions) {
      // Generate payment history based on actual billing cycle
      final paymentDates = _getHistoricalPaymentDates(subscription, now);

      for (final paymentDate in paymentDates) {
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

  List<DateTime> _getHistoricalPaymentDates(
    Subscription subscription,
    DateTime now,
  ) {
    final paymentDates = <DateTime>[];
    final billingStartDate = subscription.billingStartDate;

    // Only generate history for subscriptions that have actually started
    if (billingStartDate.isAfter(now)) {
      return paymentDates;
    }

    if (subscription.billingCycle == BillingCycle.monthly) {
      // For monthly subscriptions, generate payment on the same day each month
      DateTime currentPaymentDate = billingStartDate;

      while (currentPaymentDate.isBefore(now)) {
        paymentDates.add(currentPaymentDate);

        // Move to next month, same day
        final nextMonth = currentPaymentDate.month == 12
            ? 1
            : currentPaymentDate.month + 1;
        final nextYear = currentPaymentDate.month == 12
            ? currentPaymentDate.year + 1
            : currentPaymentDate.year;

        // Handle cases where the day doesn't exist in the next month (e.g., Jan 31 -> Feb 28)
        final daysInNextMonth = DateTime(nextYear, nextMonth + 1, 0).day;
        final dayToUse = currentPaymentDate.day > daysInNextMonth
            ? daysInNextMonth
            : currentPaymentDate.day;

        currentPaymentDate = DateTime(nextYear, nextMonth, dayToUse);
      }
    } else if (subscription.billingCycle == BillingCycle.yearly) {
      // For yearly subscriptions, generate payment on the same date each year
      DateTime currentPaymentDate = billingStartDate;

      while (currentPaymentDate.isBefore(now)) {
        paymentDates.add(currentPaymentDate);

        // Move to next year, same month and day
        currentPaymentDate = DateTime(
          currentPaymentDate.year + 1,
          currentPaymentDate.month,
          currentPaymentDate.day,
        );
      }
    }

    return paymentDates;
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

  bool _isSubscriptionActiveInMonth(
    Subscription subscription,
    int month,
    int year,
  ) {
    final billingStartDate = subscription.billingStartDate;
    final targetMonth = DateTime(year, month, 1);

    // If subscription starts in the future (after the target month), it's not active
    if (billingStartDate.isAfter(DateTime(year, month + 1, 0))) {
      return false;
    }

    // For monthly subscriptions: active in every month from start date onwards
    if (subscription.billingCycle == BillingCycle.monthly) {
      // Check if the target month is after or equal to the billing start month
      final startMonth = DateTime(
        billingStartDate.year,
        billingStartDate.month,
        1,
      );
      return targetMonth.isAfter(startMonth) ||
          targetMonth.isAtSameMomentAs(startMonth);
    }

    // For yearly subscriptions: contribute monthly amount in every month from start date onwards
    if (subscription.billingCycle == BillingCycle.yearly) {
      // Same logic - active in every month from start date onwards
      final startMonth = DateTime(
        billingStartDate.year,
        billingStartDate.month,
        1,
      );
      return targetMonth.isAfter(startMonth) ||
          targetMonth.isAtSameMomentAs(startMonth);
    }

    return false;
  }
}
