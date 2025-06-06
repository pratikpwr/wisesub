import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:wisesub/core/theme/app_colors.dart';
import 'package:wisesub/core/theme/app_text_theme.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/dotted_border_painter.dart';
import '../../domain/entities/subscription.dart';
import '../bloc/subscription_bloc.dart';
import '../bloc/subscription_event.dart';
import '../bloc/subscription_state.dart';
import 'add_subscription_bottom_sheet.dart';

class SubscriptionList extends StatelessWidget {
  const SubscriptionList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubscriptionBloc, SubscriptionState>(
      builder: (context, state) {
        return state.when(
          initial: () => const Center(
            child: Text('Welcome! Add your first subscription.'),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(color: Colors.blue),
          ),
          loaded: (subscriptions, categories, selectedCategoryId) {
            final filteredSubscriptions = selectedCategoryId == null
                ? subscriptions
                : subscriptions
                      .where((sub) => sub.categoryId == selectedCategoryId)
                      .toList();

            List<Widget> stackItems = [];

            stackItems.add(
              AnimationConfiguration.staggeredList(
                position: 0,
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(
                  horizontalOffset: 50.0,
                  child: FadeInAnimation(
                    child: _buildAddSubscriptionCard(context),
                  ),
                ),
              ),
            );

            for (int i = 0; i < filteredSubscriptions.length; i++) {
              stackItems.add(
                AnimationConfiguration.staggeredList(
                  position: i + 1,
                  duration: const Duration(milliseconds: 500),
                  child: SlideAnimation(
                    horizontalOffset: 50.0,
                    child: FadeInAnimation(
                      child: Dismissible(
                        key: Key(filteredSubscriptions[i].id),
                        direction: DismissDirection.endToStart,
                        confirmDismiss: (direction) async {
                          return await _showDeleteConfirmationDialog(
                            context,
                            filteredSubscriptions[i],
                          );
                        },
                        onDismissed: (direction) {
                          context.read<SubscriptionBloc>().add(
                            SubscriptionEvent.deleteSubscription(
                              filteredSubscriptions[i].id,
                            ),
                          );
                        },
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 30),
                          decoration: BoxDecoration(
                            color: Colors.red.shade400,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 28,
                          ),
                        ),
                        child: _buildSubscriptionCard(filteredSubscriptions[i]),
                      ),
                    ),
                  ),
                ),
              );
            }

            if (filteredSubscriptions.isEmpty) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      stackItems[0],
                      if (subscriptions.isEmpty) ...[
                        const SizedBox(height: 100),
                        Icon(
                          Icons.subscriptions,
                          size: 64,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No subscriptions yet',
                          style: AppTextStyles.emptyStateTitle,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Tap the + button to add your first subscription',
                          style: AppTextStyles.emptyStateSubtitle,
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AnimationLimiter(
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: stackItems.isEmpty
                        ? 200
                        : 180 +
                              (stackItems.length - 1) * 104.0 +
                              20, // Calculate total height needed
                    child: Stack(
                      children: [
                        for (int i = 0; i < stackItems.length; i++)
                          Positioned(
                            top:
                                i *
                                104.0, // Each card positioned 104px below the previous
                            left: 0,
                            right: 0,
                            child: stackItems[i],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          error: (failure) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 64, color: Colors.red[400]),
                const SizedBox(height: 16),
                Text(
                  'Something went wrong',
                  style: AppTextStyles.emptyStateTitle.copyWith(
                    color: Colors.red[400],
                  ),
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
                    context.read<SubscriptionBloc>().add(
                      const SubscriptionEvent.loadSubscriptions(),
                    );
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildAddSubscriptionCard(BuildContext context) {
    return GestureDetector(
      onTap: () => _showAddSubscriptionBottomSheet(context),
      child: Container(
        height: 180.0,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.topCenter,
        child: Row(
          children: [
            Text(
              'Add a subscription',
              style: AppTextTheme.getTextStyle(
                fontSize: 22,
                fontWeight: AppTextTheme.semiBold,
                color: AppColors.textPrimary,
                height: 1.27,
              ),
            ),
            const Spacer(),
            CustomPaint(
              painter: DottedBorderPainter(
                color: AppColors.iconPrimary,
                strokeWidth: 2,
                dashWidth: 5,
                dashSpace: 3,
                radius: 28,
              ),
              child: const SizedBox(
                width: 60,
                height: 60,
                child: Icon(Icons.add, color: AppColors.iconPrimary, size: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSubscriptionCard(Subscription subscription) {
    final color = subscription.color.toColor();
    final formatter = NumberFormat.currency(symbol: '\$ ', decimalDigits: 0);

    return Container(
      height: 180.0,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  subscription.name,
                  style: AppTextTheme.getTextStyle(
                    fontSize: 22,
                    fontWeight: AppTextTheme.semiBold,
                    color: AppColors.textPrimary,
                    height: 1.27,
                  ),
                ),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Text(
                    '${formatter.format(subscription.price.floor())} / ${subscription.billingCycle.name}',
                    style: AppTextStyles.cardBadge,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              subscription.name.substring(0, 1).toUpperCase(),
              style: AppTextStyles.serviceIconText.copyWith(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showAddSubscriptionBottomSheet(BuildContext context) {
    final bloc = context.read<SubscriptionBloc>();
    final state = bloc.state;

    state.maybeWhen(
      loaded: (subscriptions, categories, selectedCategoryId) {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (modalContext) => BlocProvider.value(
            value: bloc,
            child: AddSubscriptionBottomSheet(categories: categories),
          ),
        );
      },
      orElse: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Loading categories...'),
            duration: Duration(seconds: 1),
          ),
        );
      },
    );
  }

  Future<bool> _showDeleteConfirmationDialog(
    BuildContext context,
    Subscription subscription,
  ) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.backgroundSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Delete Subscription',
          style: AppTextTheme.getTextStyle(
            fontSize: 20,
            fontWeight: AppTextTheme.semiBold,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${subscription.name}"? This action cannot be undone.',
          style: AppTextTheme.getTextStyle(
            fontSize: 16,
            fontWeight: AppTextTheme.regular,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.textSecondary,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            ),
            child: Text(
              'Cancel',
              style: AppTextTheme.getTextStyle(
                fontSize: 16,
                fontWeight: AppTextTheme.medium,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
              backgroundColor: Colors.red.withOpacity(0.1),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Delete',
              style: AppTextTheme.getTextStyle(
                fontSize: 16,
                fontWeight: AppTextTheme.medium,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
    return result ?? false;
  }
}
