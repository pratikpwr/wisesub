import 'package:hive/hive.dart';

import '../../../../core/error/exceptions.dart';
import '../models/category_model.dart';
import '../models/subscription_model.dart';

const String categoriesBoxName = 'categories';

const String subscriptionsBoxName = 'subscriptions';

abstract class SubscriptionLocalDataSource {
  Future<void> addCategory(CategoryModel category);
  Future<void> addSubscription(SubscriptionModel subscription);
  Future<void> deleteCategory(String id);
  Future<void> deleteSubscription(String id);
  Future<List<CategoryModel>> getCategories();

  Future<CategoryModel> getCategory(String id);
  Future<SubscriptionModel> getSubscription(String id);
  Future<List<SubscriptionModel>> getSubscriptions();
  Future<void> updateCategory(CategoryModel category);
  Future<void> updateSubscription(SubscriptionModel subscription);
}

class SubscriptionLocalDataSourceImpl implements SubscriptionLocalDataSource {
  final Box<SubscriptionModel> subscriptionBox;
  final Box<CategoryModel> categoryBox;

  SubscriptionLocalDataSourceImpl({
    required this.subscriptionBox,
    required this.categoryBox,
  });

  @override
  Future<void> addCategory(CategoryModel category) async {
    try {
      await categoryBox.put(category.id, category);
    } catch (e) {
      throw const CacheException('Failed to add category to cache');
    }
  }

  @override
  Future<void> addSubscription(SubscriptionModel subscription) async {
    try {
      await subscriptionBox.put(subscription.id, subscription);
    } catch (e) {
      throw const CacheException('Failed to add subscription to cache');
    }
  }

  @override
  Future<void> deleteCategory(String id) async {
    try {
      await categoryBox.delete(id);
    } catch (e) {
      throw const CacheException('Failed to delete category from cache');
    }
  }

  @override
  Future<void> deleteSubscription(String id) async {
    try {
      await subscriptionBox.delete(id);
    } catch (e) {
      throw const CacheException('Failed to delete subscription from cache');
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      return categoryBox.values.toList();
    } catch (e) {
      throw const CacheException('Failed to get categories from cache');
    }
  }

  @override
  Future<CategoryModel> getCategory(String id) async {
    try {
      final category = categoryBox.get(id);
      if (category == null) {
        throw const CacheException('Category not found in cache');
      }
      return category;
    } catch (e) {
      throw const CacheException('Failed to get category from cache');
    }
  }

  @override
  Future<SubscriptionModel> getSubscription(String id) async {
    try {
      final subscription = subscriptionBox.get(id);
      if (subscription == null) {
        throw const CacheException('Subscription not found in cache');
      }
      return subscription;
    } catch (e) {
      throw const CacheException('Failed to get subscription from cache');
    }
  }

  @override
  Future<List<SubscriptionModel>> getSubscriptions() async {
    try {
      return subscriptionBox.values.toList();
    } catch (e) {
      throw const CacheException('Failed to get subscriptions from cache');
    }
  }

  @override
  Future<void> updateCategory(CategoryModel category) async {
    try {
      await categoryBox.put(category.id, category);
    } catch (e) {
      throw const CacheException('Failed to update category in cache');
    }
  }

  @override
  Future<void> updateSubscription(SubscriptionModel subscription) async {
    try {
      await subscriptionBox.put(subscription.id, subscription);
    } catch (e) {
      throw const CacheException('Failed to update subscription in cache');
    }
  }
}
