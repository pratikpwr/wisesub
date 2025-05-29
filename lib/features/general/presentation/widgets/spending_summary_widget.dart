import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../domain/entities/monthly_spending.dart';

class SpendingSummaryWidget extends StatelessWidget {
  final MonthlySpending monthlySpending;

  const SpendingSummaryWidget({super.key, required this.monthlySpending});

  @override
  Widget build(BuildContext context) {
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
                _buildPercentageChangeChip(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPercentageChangeChip() {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
    );
  }
}
