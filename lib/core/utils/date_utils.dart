import '../../../features/subscriptions/domain/entities/subscription.dart';

class DateUtils {
  static DateTime getNextPaymentDate(Subscription subscription) {
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
}
