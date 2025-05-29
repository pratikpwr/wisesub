import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/category.dart';
import '../entities/subscription.dart';

abstract class SubscriptionRepository {
  Future<Either<Failure, Unit>> addCategory(Category category);
  Future<Either<Failure, Unit>> addSubscription(Subscription subscription);
  Future<Either<Failure, Unit>> deleteCategory(String id);
  Future<Either<Failure, Unit>> deleteSubscription(String id);
  Future<Either<Failure, List<Category>>> getCategories();

  Future<Either<Failure, Category>> getCategory(String id);
  Future<Either<Failure, Subscription>> getSubscription(String id);
  Future<Either<Failure, List<Subscription>>> getSubscriptions();
  Future<Either<Failure, Unit>> updateCategory(Category category);
  Future<Either<Failure, Unit>> updateSubscription(Subscription subscription);

  Stream<Either<Failure, List<Category>>> watchCategories();
  Stream<Either<Failure, List<Subscription>>> watchSubscriptions();
}
