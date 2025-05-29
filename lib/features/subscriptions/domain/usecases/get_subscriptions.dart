import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/subscription.dart';
import '../repositories/subscription_repository.dart';

class GetSubscriptions implements UseCase<List<Subscription>, NoParams> {
  final SubscriptionRepository repository;

  GetSubscriptions(this.repository);

  @override
  Future<Either<Failure, List<Subscription>>> call(NoParams params) async {
    return await repository.getSubscriptions();
  }
}
