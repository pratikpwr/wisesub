import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/subscription_repository.dart';

class DeleteSubscription implements UseCase<Unit, DeleteSubscriptionParams> {
  final SubscriptionRepository repository;

  DeleteSubscription(this.repository);

  @override
  Future<Either<Failure, Unit>> call(DeleteSubscriptionParams params) async {
    return await repository.deleteSubscription(params.id);
  }
}

class DeleteSubscriptionParams extends Equatable {
  final String id;

  const DeleteSubscriptionParams({required this.id});

  @override
  List<Object> get props => [id];
}
