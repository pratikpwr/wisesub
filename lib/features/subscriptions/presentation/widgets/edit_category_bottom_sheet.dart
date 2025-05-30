import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisesub/core/theme/theme.dart';
import 'package:wisesub/core/utils/extensions.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/subscription.dart';
import '../bloc/subscription_bloc.dart';
import '../bloc/subscription_event.dart';
import '../bloc/subscription_state.dart';

class EditCategoryBottomSheet extends StatefulWidget {
  final Category category;

  const EditCategoryBottomSheet({super.key, required this.category});

  @override
  State<EditCategoryBottomSheet> createState() =>
      _EditCategoryBottomSheetState();
}

class _EditCategoryBottomSheetState extends State<EditCategoryBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final List<String> _selectedSubscriptionIds;

  bool get _isDefaultCategory => widget.category.id == 'default_entertainment';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.backgroundSecondary,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle bar
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.textSecondary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title and delete button
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Edit category',
                      style: AppTextTheme.getTextStyle(
                        fontSize: 24,
                        fontWeight: AppTextTheme.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                  ),
                  if (!_isDefaultCategory) // Only show delete button for non-default categories
                    IconButton(
                      onPressed: _showDeleteConfirmation,
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 24,
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 24),

              // Category name input
              Text(
                'Category name',
                style: AppTextTheme.getTextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                  fontWeight: AppTextTheme.semiBold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                style: AppTextTheme.getTextStyle(
                  fontSize: 16,
                  color: AppColors.textPrimary,
                ),
                decoration: InputDecoration(
                  hintText: 'e.g. Music',
                  hintStyle: AppTextTheme.getTextStyle(
                    fontSize: 16,
                    color: AppColors.textTertiary,
                  ),
                  filled: true,
                  fillColor: AppColors.backgroundSecondary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.textPrimary,
                      width: 1,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a category name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Subscriptions selection
              Text(
                'Select subscriptions',
                style: AppTextTheme.getTextStyle(
                  fontSize: 20,
                  color: AppColors.textPrimary,
                  fontWeight: AppTextTheme.semiBold,
                ),
              ),
              const SizedBox(height: 16),

              BlocBuilder<SubscriptionBloc, SubscriptionState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (subscriptions, categories, selectedCategoryId) {
                      if (subscriptions.isEmpty) {
                        return Container(
                          padding: const EdgeInsets.all(16),
                          child: Center(
                            child: Text(
                              'No subscriptions available.\nAdd some subscriptions first.',
                              textAlign: TextAlign.center,
                              style: AppTextTheme.getTextStyle(
                                fontSize: 14,
                                color: AppColors.textTertiary,
                              ),
                            ),
                          ),
                        );
                      }

                      return Container(
                        constraints: const BoxConstraints(maxHeight: 300),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: subscriptions.length,
                          itemBuilder: (context, index) {
                            final subscription = subscriptions[index];
                            final isSelected = _selectedSubscriptionIds
                                .contains(subscription.id);

                            return Container(
                              margin: const EdgeInsets.only(bottom: 12),
                              decoration: BoxDecoration(
                                color: AppColors.backgroundSecondary,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                children: [
                                  _buildServiceIcon(subscription),
                                  const SizedBox(width: 12),
                                  Text(
                                    subscription.name,
                                    style: AppTextTheme.getTextStyle(
                                      fontSize: 18,
                                      color: AppColors.textPrimary,
                                      fontWeight: AppTextTheme.semiBold,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        if (isSelected) {
                                          _selectedSubscriptionIds.remove(
                                            subscription.id,
                                          );
                                        } else {
                                          _selectedSubscriptionIds.add(
                                            subscription.id,
                                          );
                                        }
                                      });
                                    },
                                    icon: isSelected
                                        ? const Icon(
                                            Icons.check_circle_rounded,
                                            size: 32,
                                            color: AppColors.primary,
                                          )
                                        : const Icon(
                                            Icons.circle,
                                            size: 32,
                                            color: AppColors.surface,
                                          ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    },
                    orElse: () => const Center(
                      child: CircularProgressIndicator(color: Colors.blue),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),

              // Save button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _updateCategory,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Update Category',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.category.name);
    _selectedSubscriptionIds = List.from(widget.category.subscriptionIds);
  }

  Widget _buildServiceIcon(Subscription subscription) {
    return Container(
      width: 44,
      height: 44,
      decoration: const BoxDecoration(
        color: AppColors.iconPrimary,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Text(
        subscription.name.substring(0, 1).toUpperCase(),
        style: AppTextTheme.getTextStyle(
          fontSize: 24,
          color: subscription.color.toColor(),
          fontWeight: AppTextTheme.semiBold,
        ),
      ),
    );
  }

  void _showDeleteConfirmation() {
    // Capture the bloc reference before showing the dialog
    final bloc = context.read<SubscriptionBloc>();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.backgroundSecondary,
        title: Text(
          'Delete Category',
          style: AppTextTheme.getTextStyle(
            fontSize: 18,
            fontWeight: AppTextTheme.bold,
            color: AppColors.textPrimary,
          ),
        ),
        content: Text(
          'Are you sure you want to delete "${widget.category.name}"? This action cannot be undone. Subscriptions in this category will be moved to the default category.',
          style: AppTextTheme.getTextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(
              'Cancel',
              style: AppTextTheme.getTextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // Use the captured bloc reference instead of context.read
              bloc.add(SubscriptionEvent.deleteCategory(widget.category.id));
              Navigator.pop(dialogContext); // Close dialog
              Navigator.pop(context); // Close bottom sheet
            },
            child: Text(
              'Delete',
              style: AppTextTheme.getTextStyle(
                fontSize: 14,
                color: Colors.red,
                fontWeight: AppTextTheme.semiBold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _updateCategory() {
    if (_formKey.currentState!.validate()) {
      final updatedCategory = widget.category.copyWith(
        name: _nameController.text.trim(),
        subscriptionIds: _selectedSubscriptionIds,
      );

      context.read<SubscriptionBloc>().add(
        SubscriptionEvent.updateCategory(updatedCategory),
      );

      Navigator.pop(context);
    }
  }
}
