import 'package:equatable/equatable.dart';

import '../../../subscriptions/domain/entities/subscription.dart';

class PaymentHistory extends Equatable {
  final Subscription subscription;
  final double amount;
  final DateTime date;

  const PaymentHistory({
    required this.subscription,
    required this.amount,
    required this.date,
  });

  @override
  List<Object> get props => [subscription, amount, date];
}
