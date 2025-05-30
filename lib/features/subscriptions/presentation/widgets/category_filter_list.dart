import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisesub/core/theme/app_colors.dart';
import 'package:wisesub/core/theme/app_text_theme.dart';

import '../bloc/subscription_bloc.dart';
import '../bloc/subscription_event.dart';
import '../bloc/subscription_state.dart';
import 'add_category_bottom_sheet.dart';

class CategoryFilterList extends StatelessWidget {
  const CategoryFilterList({super.key});

  @override
  Widget build(BuildContext context) {
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
}
