import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/date_utils.dart' as app_date_utils;
import '../../../subscriptions/domain/entities/subscription.dart';

class UpcomingSubscriptionWidget extends StatelessWidget {
  final Subscription subscription;

  const UpcomingSubscriptionWidget({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 0);
    final nextPaymentDate = app_date_utils.DateUtils.getNextPaymentDate(
      subscription,
    );
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
            Expanded(child: _buildSubscriptionInfo(dayOfMonth, monthOfYear)),
            _buildPriceAndAction(formatter),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceAndAction(NumberFormat formatter) {
    return Column(
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
    );
  }

  Widget _buildSubscriptionDetails(String dayOfMonth, String monthOfYear) {
    return Column(
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
    );
  }

  Widget _buildSubscriptionIcon() {
    return Container(
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
    );
  }

  Widget _buildSubscriptionInfo(String dayOfMonth, String monthOfYear) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildSubscriptionIcon(),
        _buildSubscriptionDetails(dayOfMonth, monthOfYear),
      ],
    );
  }
}
