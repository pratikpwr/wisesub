import 'package:flutter/material.dart';

import '../widgets/category_filter_list.dart';
import '../widgets/subscription_list.dart';

class SubscriptionPageContent extends StatelessWidget {
  const SubscriptionPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CategoryFilterList(),
        SizedBox(height: 24),
        Expanded(child: SubscriptionList()),
      ],
    );
  }
}
