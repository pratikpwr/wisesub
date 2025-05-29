import 'package:equatable/equatable.dart';

class MonthlySpending extends Equatable {
  final double totalAmount;
  final int month;
  final int year;
  final double percentageChange;

  const MonthlySpending({
    required this.totalAmount,
    required this.month,
    required this.year,
    required this.percentageChange,
  });

  @override
  List<Object> get props => [totalAmount, month, year, percentageChange];
}
