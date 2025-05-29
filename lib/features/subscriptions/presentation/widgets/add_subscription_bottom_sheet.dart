import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/utils/extensions.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/subscription.dart';
import '../bloc/subscription_bloc.dart';
import '../bloc/subscription_event.dart';

class AddSubscriptionBottomSheet extends StatefulWidget {
  final List<Category> categories;

  const AddSubscriptionBottomSheet({super.key, required this.categories});

  @override
  State<AddSubscriptionBottomSheet> createState() =>
      _AddSubscriptionBottomSheetState();
}

class _AddSubscriptionBottomSheetState
    extends State<AddSubscriptionBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();

  BillingCycle _selectedBillingCycle = BillingCycle.monthly;
  Color _selectedColor = AppColors.primary;
  String? _selectedCategoryId;
  DateTime _billingStartDate = DateTime.now();

  final List<String> _popularServices = [
    'Netflix',
    'Spotify',
    'YouTube Premium',
    'Apple Music',
    'Amazon Prime',
    'Disney+',
    'HBO Max',
    'Figma',
    'Adobe Creative Cloud',
    'GitHub Pro',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
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
                    color: AppColors.textQuaternary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Title
              Text('Add a subscription', style: AppTextStyles.formTitle),
              const SizedBox(height: 24),

              // Service name input with suggestions
              Text('Service name', style: AppTextStyles.inputLabel),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                style: AppTextStyles.inputText,
                decoration: InputDecoration(
                  hintText: 'Enter service name',
                  hintStyle: AppTextStyles.inputHint,
                  filled: true,
                  fillColor: AppColors.inputFill,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter a service name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),

              // Popular services
              Text(
                'Popular services',
                style: AppTextTheme.getTextStyle(
                  fontSize: 14,
                  fontWeight: AppTextTheme.regular,
                  color: AppColors.textSecondary,
                  height: 1.43,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _popularServices.map((service) {
                  return GestureDetector(
                    onTap: () {
                      _nameController.text = service;
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.backgroundTertiary,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(service, style: AppTextStyles.chipText),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 24),

              // Price and billing cycle
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price', style: AppTextStyles.inputLabel),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _priceController,
                          keyboardType: TextInputType.number,
                          style: AppTextStyles.inputText,
                          decoration: InputDecoration(
                            hintText: '9.99',
                            hintStyle: AppTextStyles.inputHint,
                            prefixText: '\$ ',
                            prefixStyle: AppTextStyles.inputText,
                            filled: true,
                            fillColor: AppColors.inputFill,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Enter price';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Invalid price';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Billing cycle', style: AppTextStyles.inputLabel),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.inputFill,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: DropdownButtonFormField<BillingCycle>(
                            value: _selectedBillingCycle,
                            dropdownColor: AppColors.inputFill,
                            style: AppTextStyles.inputText,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 12,
                              ),
                            ),
                            items: BillingCycle.values.map((cycle) {
                              return DropdownMenuItem(
                                value: cycle,
                                child: Text(cycle.name.capitalize()),
                              );
                            }).toList(),
                            onChanged: (value) {
                              if (value != null) {
                                setState(() {
                                  _selectedBillingCycle = value;
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Color picker
              Text('Color theme', style: AppTextStyles.inputLabel),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _showColorPicker,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.inputFill,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          color: _selectedColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _selectedColor.toHex().toUpperCase(),
                        style: AppTextStyles.inputText,
                      ),
                      const Spacer(),
                      Icon(Icons.palette, color: AppColors.textTertiary),
                      const SizedBox(width: 12),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Billing start date
              Text('Billing start date', style: AppTextStyles.inputLabel),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: _selectDate,
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.inputFill,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      Icon(Icons.calendar_month, color: AppColors.textTertiary),
                      const SizedBox(width: 12),
                      Text(
                        '${_billingStartDate.day}/${_billingStartDate.month}/${_billingStartDate.year}',
                        style: AppTextStyles.inputText,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Category selection
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Category', style: AppTextStyles.inputLabel),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.inputFill,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: _selectedCategoryId,
                      dropdownColor: AppColors.inputFill,
                      style: AppTextStyles.inputText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                        ),
                        hintText: 'Select category',
                        hintStyle: AppTextStyles.inputHint,
                      ),
                      items: widget.categories.map((category) {
                        return DropdownMenuItem(
                          value: category.id,
                          child: Text(category.name),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCategoryId = value;
                        });
                      },
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Add button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _addSubscription,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.textPrimary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    'Add Subscription',
                    style: AppTextStyles.buttonPrimary,
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
    _priceController.dispose();
    super.dispose();
  }

  void _addSubscription() {
    if (_formKey.currentState!.validate()) {
      final subscription = Subscription(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text.trim(),
        price: double.parse(_priceController.text),
        billingCycle: _selectedBillingCycle,
        color: _selectedColor.toHex(),
        billingStartDate: _billingStartDate,
        categoryId: _selectedCategoryId!,
        createdAt: DateTime.now(),
      );

      context.read<SubscriptionBloc>().add(
        SubscriptionEvent.addSubscription(subscription),
      );

      Navigator.pop(context);
    }
  }

  Future<void> _selectDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _billingStartDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.dark(
              primary: AppColors.primary,
              surface: AppColors.surface,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _billingStartDate) {
      setState(() {
        _billingStartDate = picked;
      });
    }
  }

  void _showColorPicker() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surface,
        title: Text('Pick a color', style: AppTextStyles.formSectionTitle),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: _selectedColor,
            onColorChanged: (color) {
              setState(() {
                _selectedColor = color;
              });
            },
            enableAlpha: false,
            displayThumbColor: true,
            pickerAreaHeightPercent: 0.8,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Done', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
