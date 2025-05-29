import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/payment_history.dart';

class PaymentHistoryItemWidget extends StatelessWidget {
  final PaymentHistory payment;

  const PaymentHistoryItemWidget({super.key, required this.payment});

  @override
  Widget build(BuildContext context) {
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
          _buildSubscriptionIcon(),
          const SizedBox(width: 12),
          Expanded(child: _buildPaymentDetails()),
          _buildPaymentAmount(formatter),
        ],
      ),
    );
  }

  Widget _buildPaymentAmount(NumberFormat formatter) {
    return Text(
      '– ${formatter.format(payment.amount)}',
      style: AppTextTheme.getTextStyle(
        fontSize: 18,
        fontWeight: AppTextTheme.bold,
        color: AppColors.textPrimary,
        height: 1.25,
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Column(
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
    );
  }

  Widget _buildSubscriptionIcon() {
    return Container(
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
    );
  }
}
