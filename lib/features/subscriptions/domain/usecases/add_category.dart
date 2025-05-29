import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/category.dart';
import '../repositories/subscription_repository.dart';

class AddCategory implements UseCase<Unit, AddCategoryParams> {
  final SubscriptionRepository repository;

  AddCategory(this.repository);

  @override
  Future<Either<Failure, Unit>> call(AddCategoryParams params) async {
    return await repository.addCategory(params.category);
  }
}

class AddCategoryParams extends Equatable {
  final Category category;

  const AddCategoryParams({required this.category});

  @override
  List<Object> get props => [category];
}
