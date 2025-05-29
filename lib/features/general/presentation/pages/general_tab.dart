import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/extensions.dart';
import '../../../subscriptions/domain/entities/subscription.dart';
import '../../domain/entities/payment_history.dart';
import '../bloc/general_bloc.dart';
import '../bloc/general_event.dart';
import '../bloc/general_state.dart';

class GeneralTab extends StatelessWidget {
  const GeneralTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<GeneralBloc, GeneralState>(
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
              loaded: (monthlySpending, upcomingSubscription, paymentHistory) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildSpendingSummary(monthlySpending),
                      const SizedBox(height: 32),
                      if (upcomingSubscription != null)
                        _buildUpcomingSubscription(upcomingSubscription),
                      const SizedBox(height: 32),
                      if (paymentHistory.isNotEmpty)
                        _buildPaymentHistory(paymentHistory),
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
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<GeneralBloc>().add(
                          const GeneralEvent.refreshGeneral(),
                        );
                      },
                      child: const Text('Retry'),
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

  Widget _buildPaymentHistory(List<PaymentHistory> paymentHistory) {
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

  Widget _buildPaymentHistoryItem(PaymentHistory payment) {
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

  Widget _buildSpendingSummary(monthlySpending) {
    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 2);
    final monthName = DateFormat.MMMM().format(
      DateTime(monthlySpending.year, monthlySpending.month),
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
                formatter.format(monthlySpending.totalAmount),
                style: AppTextTheme.getTextStyle(
                  fontSize: 64,
                  fontWeight: AppTextTheme.semiBold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(width: 12),
              if (monthlySpending.percentageChange != 0)
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: monthlySpending.percentageChange > 0
                        ? AppColors.secondary
                        : AppColors.error,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '${monthlySpending.percentageChange > 0 ? '+' : ''}${monthlySpending.percentageChange.toStringAsFixed(0)}%',
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

  Widget _buildUpcomingSubscription(subscription) {
    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 0);
    final nextPaymentDate = _getNextPaymentDate(subscription);
    final dayOfMonth = nextPaymentDate.day.toString().padLeft(2, '0');
    final monthOfYear = nextPaymentDate.month.toString().padLeft(2, '0');

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          // color: subscription.color.toColor(),
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
                        // color: subscription.color.toColor(),
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
      ),
    );
  }

  DateTime _getNextPaymentDate(subscription) {
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
