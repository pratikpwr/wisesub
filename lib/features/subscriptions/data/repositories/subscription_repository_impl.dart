import 'package:dartz/dartz.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/subscription.dart';
import '../../domain/repositories/subscription_repository.dart';
import '../datasources/subscription_local_data_source.dart';
import '../models/category_model.dart';
import '../models/subscription_model.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionLocalDataSource localDataSource;

  SubscriptionRepositoryImpl({required this.localDataSource});

  @override
  Future<Either<Failure, Unit>> addCategory(Category category) async {
    try {
      final categoryModel = CategoryModel.fromEntity(category);
      await localDataSource.addCategory(categoryModel);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while adding category'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> addSubscription(
    Subscription subscription,
  ) async {
    try {
      final subscriptionModel = SubscriptionModel.fromEntity(subscription);
      await localDataSource.addSubscription(subscriptionModel);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while adding subscription'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteCategory(String id) async {
    try {
      await localDataSource.deleteCategory(id);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while deleting category'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteSubscription(String id) async {
    try {
      await localDataSource.deleteSubscription(id);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while deleting subscription'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final categoryModels = await localDataSource.getCategories();
      final categories = categoryModels
          .map((model) => model.toEntity())
          .toList();
      return Right(categories);
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while getting categories'),
      );
    }
  }

  @override
  Future<Either<Failure, Category>> getCategory(String id) async {
    try {
      final categoryModel = await localDataSource.getCategory(id);
      return Right(categoryModel.toEntity());
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while getting category'),
      );
    }
  }

  @override
  Future<Either<Failure, Subscription>> getSubscription(String id) async {
    try {
      final subscriptionModel = await localDataSource.getSubscription(id);
      return Right(subscriptionModel.toEntity());
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while getting subscription'),
      );
    }
  }

  @override
  Future<Either<Failure, List<Subscription>>> getSubscriptions() async {
    try {
      final subscriptionModels = await localDataSource.getSubscriptions();
      final subscriptions = subscriptionModels
          .map((model) => model.toEntity())
          .toList();
      return Right(subscriptions);
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while getting subscriptions'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCategory(Category category) async {
    try {
      final categoryModel = CategoryModel.fromEntity(category);
      await localDataSource.updateCategory(categoryModel);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while updating category'),
      );
    }
  }

  @override
  Future<Either<Failure, Unit>> updateSubscription(
    Subscription subscription,
  ) async {
    try {
      final subscriptionModel = SubscriptionModel.fromEntity(subscription);
      await localDataSource.updateSubscription(subscriptionModel);
      return const Right(unit);
    } on CacheException catch (e) {
      return Left(StorageFailure(e.message));
    } catch (e) {
      return Left(
        StorageFailure('Unknown error occurred while updating subscription'),
      );
    }
  }

  @override
  Stream<Either<Failure, List<Category>>> watchCategories() {
    // For simplicity, we'll implement this as a simple stream
    // In a real app, you might want to listen to Hive box changes
    return Stream.periodic(
      const Duration(seconds: 1),
    ).asyncMap((_) => getCategories());
  }

  @override
  Stream<Either<Failure, List<Subscription>>> watchSubscriptions() {
    // For simplicity, we'll implement this as a simple stream
    // In a real app, you might want to listen to Hive box changes
    return Stream.periodic(
      const Duration(seconds: 1),
    ).asyncMap((_) => getSubscriptions());
  }
}
