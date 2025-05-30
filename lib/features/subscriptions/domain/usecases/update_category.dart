import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/category.dart';
import '../repositories/subscription_repository.dart';

class UpdateCategory implements UseCase<Unit, UpdateCategoryParams> {
  final SubscriptionRepository repository;

  UpdateCategory(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateCategoryParams params) async {
    return await repository.updateCategory(params.category);
  }
}

class UpdateCategoryParams extends Equatable {
  final Category category;

  const UpdateCategoryParams({required this.category});

  @override
  List<Object> get props => [category];
}
