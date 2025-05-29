import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../subscriptions/domain/entities/subscription.dart';
import '../repositories/general_repository.dart';

class GetUpcomingSubscriptionRenewal
    implements UseCase<Subscription?, NoParams> {
  final GeneralRepository repository;

  const GetUpcomingSubscriptionRenewal(this.repository);

  @override
  Future<Either<Failure, Subscription?>> call(NoParams params) async {
    return await repository.getUpcomingSubscriptionRenewal();
  }
}
