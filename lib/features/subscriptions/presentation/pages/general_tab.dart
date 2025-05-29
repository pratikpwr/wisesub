import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/subscription.dart';
import '../bloc/subscription_bloc.dart';
import '../bloc/subscription_state.dart';

class GeneralTab extends StatelessWidget {
  const GeneralTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<SubscriptionBloc, SubscriptionState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(
                child: Text(
                  'Welcome! Add your first subscription.',
                  style: AppTextStyles.emptyStateTitle,
                ),
              ),
              loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              ),
              loaded: (subscriptions, categories, selectedCategoryId) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildSpendingSummary(subscriptions),
                      const SizedBox(height: 32),
                      _buildUpcomingSubscriptions(subscriptions),
                      const SizedBox(height: 32),
                      _buildPaymentHistory(subscriptions),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
              error: (failure) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 64, color: AppColors.error),
                    const SizedBox(height: 16),
                    Text(
                      'Something went wrong',
                      style: AppTextStyles.errorText.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      failure.message,
                      style: AppTextStyles.emptyStateSubtitle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPaymentHistory(List<Subscription> subscriptions) {
    if (subscriptions.isEmpty) {
      return const SizedBox();
    }

    // Get recent payments (simulate payment history)
    final paymentHistory = _getPaymentHistory(subscriptions);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment history',
            style: AppTextTheme.getTextStyle(
              fontSize: 28,
              fontWeight: AppTextTheme.semiBold,
              color: AppColors.textPrimary,
              height: 1.2,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.backgroundSecondary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: paymentHistory
                  .map((payment) => _buildPaymentHistoryItem(payment))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentHistoryItem(PaymentHistoryItem payment) {
    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 2);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: AppColors.iconPrimary,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              payment.subscription.name.substring(0, 1).toUpperCase(),
              style: AppTextTheme.getTextStyle(
                fontWeight: AppTextTheme.semiBold,
                color: payment.subscription.color.toColor(),
                fontSize: 24,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  payment.subscription.name,
                  style: AppTextTheme.getTextStyle(
                    fontSize: 18,
                    fontWeight: AppTextTheme.semiBold,
                    color: AppColors.textPrimary,
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('dd.MM.yyyy, \'at\' h:mm a').format(payment.date),
                  style: AppTextTheme.getTextStyle(
                    fontSize: 12,
                    fontWeight: AppTextTheme.regular,
                    color: AppColors.textSecondary,
                    height: 1.33,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '– ${formatter.format(payment.amount)}',
            style: AppTextTheme.getTextStyle(
              fontSize: 18,
              fontWeight: AppTextTheme.bold,
              color: AppColors.textPrimary,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSpendingSummary(List<Subscription> subscriptions) {
    final currentMonth = DateTime.now().month;
    final currentYear = DateTime.now().year;
    final monthlyTotal = _calculateMonthlySpending(subscriptions);
    final previousMonthTotal = _calculatePreviousMonthSpending(subscriptions);
    final percentageChange = _calculatePercentageChange(
      previousMonthTotal,
      monthlyTotal,
    );

    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 2);
    final monthName = DateFormat.MMMM().format(
      DateTime(currentYear, currentMonth),
    );

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Spent for $monthName',
            style: AppTextTheme.getTextStyle(
              fontSize: 20,
              fontWeight: AppTextTheme.semiBold,
              color: AppColors.textPrimary,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                formatter.format(monthlyTotal),
                style: AppTextTheme.getTextStyle(
                  fontSize: 64,
                  fontWeight: AppTextTheme.semiBold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 12),
              if (percentageChange != 0)
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: percentageChange > 0
                        ? AppColors.secondary
                        : AppColors.error,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${percentageChange > 0 ? '+' : ''}${percentageChange.toStringAsFixed(0)}%',
                    style: AppTextTheme.getTextStyle(
                      fontSize: 12,
                      fontWeight: AppTextTheme.semiBold,
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSubscriptionCard(Subscription subscription) {
    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 0);
    final nextPaymentDate = _getNextPaymentDate(subscription);
    final dayOfMonth = nextPaymentDate.day.toString().padLeft(2, '0');
    final monthOfYear = nextPaymentDate.month.toString().padLeft(2, '0');

    return Container(
      height: 200,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: subscription.color.toColor(), // Spotify green color
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          topRight: Radius.circular(25),
          bottomRight: Radius.circular(5),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: AppColors.iconPrimary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    subscription.name.substring(0, 1).toUpperCase(),
                    style: AppTextTheme.getTextStyle(
                      fontSize: 32,
                      fontWeight: AppTextTheme.semiBold,
                      color: subscription.color.toColor(),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      subscription.name,
                      style: AppTextTheme.getTextStyle(
                        fontSize: 24,
                        fontWeight: AppTextTheme.semiBold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    Text(
                      'Upcoming payment $dayOfMonth.$monthOfYear',
                      style: AppTextTheme.getTextStyle(
                        fontSize: 16,
                        fontWeight: AppTextTheme.regular,
                        color: AppColors.textSecondary,
                        height: 1.43,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatter.format(subscription.price),
                style: AppTextTheme.getTextStyle(
                  fontSize: 30,
                  fontWeight: AppTextTheme.bold,
                  color: AppColors.textPrimary,
                  height: 1.17,
                ),
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.iconPrimary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: AppColors.iconPrimaryContrast,
                  size: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUpcomingSubscriptions(List<Subscription> subscriptions) {
    if (subscriptions.isEmpty) {
      return const SizedBox();
    }

    // Get the next upcoming subscription payment
    final upcomingSubscription = _getNextUpcomingSubscription(subscriptions);

    if (upcomingSubscription == null) {
      return const SizedBox();
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: _buildSubscriptionCard(upcomingSubscription),
    );
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

  List<PaymentHistoryItem> _getPaymentHistory(
    List<Subscription> subscriptions,
  ) {
    final history = <PaymentHistoryItem>[];
    final now = DateTime.now();

    // Generate some mock payment history for the last 30 days
    for (final subscription in subscriptions) {
      // Add a few recent payments for each subscription
      for (int i = 1; i <= 3; i++) {
        final paymentDate = now.subtract(
          Duration(days: i * 7 + (subscriptions.indexOf(subscription) * 2)),
        );
        history.add(
          PaymentHistoryItem(
            subscription: subscription,
            amount: subscription.price,
            date: paymentDate,
          ),
        );
      }
    }

    // Sort by date (most recent first)
    history.sort((a, b) => b.date.compareTo(a.date));

    return history.take(6).toList(); // Show only recent 6 payments
  }

  List<Subscription> _getUpcomingSubscriptions(
    List<Subscription> subscriptions,
  ) {
    final now = DateTime.now();
    final upcoming = <Subscription>[];

    for (final subscription in subscriptions) {
      final nextPayment = _getNextPaymentDate(subscription);
      final daysDifference = nextPayment.difference(now).inDays;

      // Show subscriptions with payments in the next 7 days
      if (daysDifference >= 0 && daysDifference <= 7) {
        upcoming.add(subscription);
      }
    }

    // Sort by next payment date
    upcoming.sort((a, b) {
      final dateA = _getNextPaymentDate(a);
      final dateB = _getNextPaymentDate(b);
      return dateA.compareTo(dateB);
    });

    return upcoming.take(3).toList(); // Show only first 3
  }
}

class PaymentHistoryItem {
  final Subscription subscription;
  final double amount;
  final DateTime date;

  PaymentHistoryItem({
    required this.subscription,
    required this.amount,
    required this.date,
  });
}
