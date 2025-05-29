import 'package:hive/hive.dart';

import '../../domain/entities/category.dart';

part 'category_model.g.dart';

@HiveType(typeId: 1)
class CategoryModel extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  List<String> subscriptionIds;

  @HiveField(3)
  DateTime createdAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.subscriptionIds,
    required this.createdAt,
  });

  factory CategoryModel.fromEntity(Category category) {
    return CategoryModel(
      id: category.id,
      name: category.name,
      subscriptionIds: category.subscriptionIds,
      createdAt: category.createdAt,
    );
  }

  Category toEntity() {
    return Category(
      id: id,
      name: name,
      subscriptionIds: subscriptionIds,
      createdAt: createdAt,
    );
  }
}
