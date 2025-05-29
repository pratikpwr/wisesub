import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_event.freezed.dart';

@freezed
class GeneralEvent with _$GeneralEvent {
  const factory GeneralEvent.loadGeneral() = _LoadGeneral;

  const factory GeneralEvent.loadMonthlySpending({
    required int month,
    required int year,
  }) = _LoadMonthlySpending;

  const factory GeneralEvent.refreshGeneral() = _RefreshGeneral;
}
