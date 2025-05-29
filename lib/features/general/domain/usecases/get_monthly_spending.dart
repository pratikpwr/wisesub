import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/monthly_spending.dart';
import '../repositories/general_repository.dart';

class GetMonthlySpending
    implements UseCase<MonthlySpending, MonthlySpendingParams> {
  final GeneralRepository repository;

  const GetMonthlySpending(this.repository);

  @override
  Future<Either<Failure, MonthlySpending>> call(
    MonthlySpendingParams params,
  ) async {
    return await repository.getMonthlySpending(params.month, params.year);
  }
}

class MonthlySpendingParams extends Equatable {
  final int month;
  final int year;

  const MonthlySpendingParams({required this.month, required this.year});

  @override
  List<Object> get props => [month, year];
}
