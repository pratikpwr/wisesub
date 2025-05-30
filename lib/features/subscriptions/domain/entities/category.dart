import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final List<String> subscriptionIds;
  final DateTime createdAt;

  const Category({
    required this.id,
    required this.name,
    required this.subscriptionIds,
    required this.createdAt,
  });

  @override
  List<Object> get props => [id, name, subscriptionIds, createdAt];

  Category copyWith({
    String? id,
    String? name,
    List<String>? subscriptionIds,
    DateTime? createdAt,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      subscriptionIds: subscriptionIds ?? this.subscriptionIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
