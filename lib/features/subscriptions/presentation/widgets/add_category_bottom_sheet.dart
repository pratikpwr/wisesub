import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wisesub/core/theme/theme.dart';
import 'package:wisesub/core/utils/extensions.dart';

import '../../domain/entities/category.dart';
import '../../domain/entities/subscription.dart';
import '../bloc/subscription_bloc.dart';
import '../bloc/subscription_event.dart';
import '../bloc/subscription_state.dart';

class AddCategoryBottomSheet extends StatefulWidget {
  const AddCategoryBottomSheet({super.key});

  @override
  State<AddCategoryBottomSheet> createState() => _AddCategoryBottomSheetState();
}

class _AddCategoryBottomSheetState extends State<AddCategoryBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final List<String> _selectedSubscriptionIds = [];

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

              // Title
              Text(
                'Add a category',
                style: AppTextTheme.getTextStyle(
                  fontSize: 24,
                  fontWeight: AppTextTheme.bold,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 24),

              // Category name input
              Text(
                'Enter a name',
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
                  onPressed: _addCategory,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Save',
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

  void _addCategory() {
    if (_formKey.currentState!.validate()) {
      final category = Category(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        subscriptionIds: _selectedSubscriptionIds,
        createdAt: DateTime.now(),
      );

      context.read<SubscriptionBloc>().add(
        SubscriptionEvent.addCategory(category),
      );

      Navigator.pop(context);
    }
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
}
