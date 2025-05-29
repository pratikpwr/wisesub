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
import '../widgets/add_category_bottom_sheet.dart';
import '../widgets/add_subscription_bottom_sheet.dart';

class SubscriptionPageContent extends StatelessWidget {
  const SubscriptionPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCategoryFilters(),
        const SizedBox(height: 24),
        Expanded(child: _buildSubscriptionsList()),
      ],
    );
  }

  Widget _buildAddCategoryButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: () => _showAddCategoryBottomSheet(context),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.backgroundTertiary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: const Icon(Icons.add, color: Colors.white, size: 24),
        ),
      ),
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

  Widget _buildCategoryChip(String label, bool isSelected, VoidCallback onTap) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.primary
                : AppColors.backgroundTertiary,
            borderRadius: BorderRadius.circular(25),
          ),
          alignment: Alignment.center,
          child: Text(label, style: AppTextStyles.buttonSecondary),
        ),
      ),
    );
  }

  Widget _buildCategoryFilters() {
    return BlocBuilder<SubscriptionBloc, SubscriptionState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (subscriptions, categories, selectedCategoryId) {
            return Container(
              height: 42,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length + 2,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return _buildCategoryChip(
                            'All subs',
                            selectedCategoryId == null,
                            () {
                              context.read<SubscriptionBloc>().add(
                                const SubscriptionEvent.filterByCategory(null),
                              );
                            },
                          );
                        } else if (index == categories.length + 1) {
                          return _buildAddCategoryButton(context);
                        } else {
                          final category = categories[index - 1];
                          return _buildCategoryChip(
                            category.name,
                            selectedCategoryId == category.id,
                            () {
                              context.read<SubscriptionBloc>().add(
                                SubscriptionEvent.filterByCategory(category.id),
                              );
                            },
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
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

  Widget _buildSubscriptionsList() {
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
                      child: _buildSubscriptionCard(filteredSubscriptions[i]),
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
                  child: Column(
                    children: [
                      // Build the overlapping cards using Transform.translate
                      for (int i = 0; i < stackItems.length; i++)
                        Transform.translate(
                          offset: Offset(
                            0,
                            i == 0 ? 0 : -76.0 * i,
                          ), // Overlap by 76px per card
                          child: Container(
                            margin: EdgeInsets.only(
                              bottom: i == stackItems.length - 1
                                  ? 20
                                  : 0, // Add bottom padding to last item
                            ),
                            child: stackItems[i],
                          ),
                        ),
                      // Add extra spacing at the bottom to account for the overlapping
                      SizedBox(
                        height: stackItems.length > 1
                            ? 76.0 * (stackItems.length - 1)
                            : 0,
                      ),
                    ],
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

  void _showAddCategoryBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (modalContext) => BlocProvider.value(
        value: context.read<SubscriptionBloc>(),
        child: const AddCategoryBottomSheet(),
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
}
