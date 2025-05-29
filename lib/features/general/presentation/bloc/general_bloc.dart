import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/get_monthly_spending.dart';
import '../../domain/usecases/get_payment_history.dart';
import '../../domain/usecases/get_upcoming_subscription_renewal.dart';
import 'general_event.dart';
import 'general_state.dart';

class GeneralBloc extends Bloc<GeneralEvent, GeneralState> {
  final GetMonthlySpending getMonthlySpending;
  final GetUpcomingSubscriptionRenewal getUpcomingSubscriptionRenewal;
  final GetPaymentHistory getPaymentHistory;

  GeneralBloc({
    required this.getMonthlySpending,
    required this.getUpcomingSubscriptionRenewal,
    required this.getPaymentHistory,
  }) : super(const GeneralState.initial()) {
    on<GeneralEvent>((event, emit) async {
      await event.when(
        loadGeneral: () => _onLoadGeneral(emit),
        refreshGeneral: () => _onRefreshGeneral(emit),
        loadMonthlySpending: (month, year) =>
            _onLoadMonthlySpending(month, year, emit),
      );
    });
  }

  Future<void> _loadAllData(Emitter<GeneralState> emit) async {
    final currentTime = DateTime.now();

    // Load monthly spending for current month
    final monthlySpendingResult = await getMonthlySpending(
      MonthlySpendingParams(month: currentTime.month, year: currentTime.year),
    );

    if (emit.isDone) return;

    await monthlySpendingResult.fold(
      (failure) async {
        if (!emit.isDone) {
          emit(GeneralState.error(failure));
        }
      },
      (monthlySpending) async {
        // Load upcoming subscription renewal
        final upcomingSubscriptionResult = await getUpcomingSubscriptionRenewal(
          NoParams(),
        );

        if (emit.isDone) return;

        await upcomingSubscriptionResult.fold(
          (failure) async {
            if (!emit.isDone) {
              emit(GeneralState.error(failure));
            }
          },
          (upcomingSubscription) async {
            // Load payment history
            final paymentHistoryResult = await getPaymentHistory(
              const PaymentHistoryParams(limit: 6),
            );

            if (emit.isDone) return;

            paymentHistoryResult.fold(
              (failure) {
                if (!emit.isDone) {
                  emit(GeneralState.error(failure));
                }
              },
              (paymentHistory) {
                if (!emit.isDone) {
                  emit(
                    GeneralState.loaded(
                      monthlySpending: monthlySpending,
                      upcomingSubscription: upcomingSubscription,
                      paymentHistory: paymentHistory,
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  Future<void> _onLoadGeneral(Emitter<GeneralState> emit) async {
    if (emit.isDone) return;
    emit(const GeneralState.loading());
    await _loadAllData(emit);
  }

  Future<void> _onLoadMonthlySpending(
    int month,
    int year,
    Emitter<GeneralState> emit,
  ) async {
    if (emit.isDone) return;
    emit(const GeneralState.loading());

    // Load monthly spending first
    final monthlySpendingResult = await getMonthlySpending(
      MonthlySpendingParams(month: month, year: year),
    );

    if (emit.isDone) return;

    await monthlySpendingResult.fold(
      (failure) async {
        if (!emit.isDone) {
          emit(GeneralState.error(failure));
        }
      },
      (monthlySpending) async {
        // Load upcoming subscription renewal
        final upcomingSubscriptionResult = await getUpcomingSubscriptionRenewal(
          NoParams(),
        );

        if (emit.isDone) return;

        await upcomingSubscriptionResult.fold(
          (failure) async {
            if (!emit.isDone) {
              emit(GeneralState.error(failure));
            }
          },
          (upcomingSubscription) async {
            // Load payment history
            final paymentHistoryResult = await getPaymentHistory(
              const PaymentHistoryParams(limit: 6),
            );

            if (emit.isDone) return;

            paymentHistoryResult.fold(
              (failure) {
                if (!emit.isDone) {
                  emit(GeneralState.error(failure));
                }
              },
              (paymentHistory) {
                if (!emit.isDone) {
                  emit(
                    GeneralState.loaded(
                      monthlySpending: monthlySpending,
                      upcomingSubscription: upcomingSubscription,
                      paymentHistory: paymentHistory,
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }

  Future<void> _onRefreshGeneral(Emitter<GeneralState> emit) async {
    if (emit.isDone) return;
    emit(const GeneralState.loading());
    await _loadAllData(emit);
  }
}
