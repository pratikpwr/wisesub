import 'package:equatable/equatable.dart';

enum BillingCycle {
  monthly,
  yearly;

  String get name {
    switch (this) {
      case BillingCycle.monthly:
        return 'month';
      case BillingCycle.yearly:
        return 'year';
    }
  }
}

class Subscription extends Equatable {
  final String id;
  final String name;
  final double price;
  final BillingCycle billingCycle;
  final String color;
  final DateTime billingStartDate;
  final String categoryId;
  final DateTime createdAt;

  const Subscription({
    required this.id,
    required this.name,
    required this.price,
    required this.billingCycle,
    required this.color,
    required this.billingStartDate,
    required this.categoryId,
    required this.createdAt,
  });

  double get monthlyPrice {
    if (billingCycle == BillingCycle.monthly) {
      return price;
    } else {
      return price / 12;
    }
  }

  @override
  List<Object> get props => [
    id,
    name,
    price,
    billingCycle,
    color,
    billingStartDate,
    categoryId,
    createdAt,
  ];

  double get yearlyPrice {
    if (billingCycle == BillingCycle.yearly) {
      return price;
    } else {
      return price * 12;
    }
  }

  Subscription copyWith({
    String? id,
    String? name,
    double? price,
    BillingCycle? billingCycle,
    String? color,
    DateTime? billingStartDate,
    String? categoryId,
    DateTime? createdAt,
  }) {
    return Subscription(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      billingCycle: billingCycle ?? this.billingCycle,
      color: color ?? this.color,
      billingStartDate: billingStartDate ?? this.billingStartDate,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
