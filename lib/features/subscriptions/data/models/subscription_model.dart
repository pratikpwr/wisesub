import 'package:hive/hive.dart';

import '../../domain/entities/subscription.dart';

part 'subscription_model.g.dart';

@HiveType(typeId: 0)
class SubscriptionModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  double price;

  @HiveField(3)
  String billingCycle; // 'monthly' or 'yearly'

  @HiveField(4)
  String color;

  @HiveField(5)
  DateTime billingStartDate;

  @HiveField(6)
  String? categoryId; // Made optional

  @HiveField(7)
  DateTime createdAt;

  SubscriptionModel({
    required this.id,
    required this.name,
    required this.price,
    required this.billingCycle,
    required this.color,
    required this.billingStartDate,
    this.categoryId, // Made optional
    required this.createdAt,
  });

  factory SubscriptionModel.fromEntity(Subscription subscription) {
    return SubscriptionModel(
      id: subscription.id,
      name: subscription.name,
      price: subscription.price,
      billingCycle: subscription.billingCycle.name,
      color: subscription.color,
      billingStartDate: subscription.billingStartDate,
      categoryId: subscription.categoryId,
      createdAt: subscription.createdAt,
    );
  }

  Subscription toEntity() {
    return Subscription(
      id: id,
      name: name,
      price: price,
      billingCycle: billingCycle == 'monthly'
          ? BillingCycle.monthly
          : BillingCycle.yearly,
      color: color,
      billingStartDate: billingStartDate,
      categoryId: categoryId,
      createdAt: createdAt,
    );
  }
}
