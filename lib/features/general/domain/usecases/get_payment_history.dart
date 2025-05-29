import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/payment_history.dart';
import '../repositories/general_repository.dart';

class GetPaymentHistory
    implements UseCase<List<PaymentHistory>, PaymentHistoryParams> {
  final GeneralRepository repository;

  const GetPaymentHistory(this.repository);

  @override
  Future<Either<Failure, List<PaymentHistory>>> call(
    PaymentHistoryParams params,
  ) async {
    return await repository.getPaymentHistory(limit: params.limit);
  }
}

class PaymentHistoryParams extends Equatable {
  final int limit;

  const PaymentHistoryParams({this.limit = 10});

  @override
  List<Object> get props => [limit];
}
