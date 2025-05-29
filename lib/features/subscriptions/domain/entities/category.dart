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
}
