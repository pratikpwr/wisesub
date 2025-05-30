import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/subscription.dart';
import '../repositories/subscription_repository.dart';

class UpdateSubscription implements UseCase<Unit, UpdateSubscriptionParams> {
  final SubscriptionRepository repository;

  UpdateSubscription(this.repository);

  @override
  Future<Either<Failure, Unit>> call(UpdateSubscriptionParams params) async {
    return await repository.updateSubscription(params.subscription);
  }
}

class UpdateSubscriptionParams extends Equatable {
  final Subscription subscription;

  const UpdateSubscriptionParams({required this.subscription});

  @override
  List<Object> get props => [subscription];
}
