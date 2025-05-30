import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/subscription_repository.dart';

class DeleteCategory implements UseCase<Unit, DeleteCategoryParams> {
  final SubscriptionRepository repository;

  DeleteCategory(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteCategoryParams params) async {
    return await repository.deleteCategory(params.id);
  }
}

class DeleteCategoryParams extends Equatable {
  final String id;

  const DeleteCategoryParams({required this.id});

  @override
  List<Object> get props => [id];
}
