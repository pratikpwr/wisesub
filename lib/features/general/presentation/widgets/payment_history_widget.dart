import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../domain/entities/payment_history.dart';
import 'payment_history_item_widget.dart';

class PaymentHistoryWidget extends StatelessWidget {
  final List<PaymentHistory> paymentHistory;

  const PaymentHistoryWidget({super.key, required this.paymentHistory});

  @override
  Widget build(BuildContext context) {
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
                  .map((payment) => PaymentHistoryItemWidget(payment: payment))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
