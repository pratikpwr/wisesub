// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'general_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeneralEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadGeneral,
    required TResult Function(int month, int year) loadMonthlySpending,
    required TResult Function() refreshGeneral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadGeneral,
    TResult? Function(int month, int year)? loadMonthlySpending,
    TResult? Function()? refreshGeneral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadGeneral,
    TResult Function(int month, int year)? loadMonthlySpending,
    TResult Function()? refreshGeneral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGeneral value) loadGeneral,
    required TResult Function(_LoadMonthlySpending value) loadMonthlySpending,
    required TResult Function(_RefreshGeneral value) refreshGeneral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadGeneral value)? loadGeneral,
    TResult? Function(_LoadMonthlySpending value)? loadMonthlySpending,
    TResult? Function(_RefreshGeneral value)? refreshGeneral,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGeneral value)? loadGeneral,
    TResult Function(_LoadMonthlySpending value)? loadMonthlySpending,
    TResult Function(_RefreshGeneral value)? refreshGeneral,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralEventCopyWith<$Res> {
  factory $GeneralEventCopyWith(
          GeneralEvent value, $Res Function(GeneralEvent) then) =
      _$GeneralEventCopyWithImpl<$Res, GeneralEvent>;
}

/// @nodoc
class _$GeneralEventCopyWithImpl<$Res, $Val extends GeneralEvent>
    implements $GeneralEventCopyWith<$Res> {
  _$GeneralEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GeneralEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadGeneralImplCopyWith<$Res> {
  factory _$$LoadGeneralImplCopyWith(
          _$LoadGeneralImpl value, $Res Function(_$LoadGeneralImpl) then) =
      __$$LoadGeneralImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadGeneralImplCopyWithImpl<$Res>
    extends _$GeneralEventCopyWithImpl<$Res, _$LoadGeneralImpl>
    implements _$$LoadGeneralImplCopyWith<$Res> {
  __$$LoadGeneralImplCopyWithImpl(
      _$LoadGeneralImpl _value, $Res Function(_$LoadGeneralImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadGeneralImpl implements _LoadGeneral {
  const _$LoadGeneralImpl();

  @override
  String toString() {
    return 'GeneralEvent.loadGeneral()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadGeneralImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadGeneral,
    required TResult Function(int month, int year) loadMonthlySpending,
    required TResult Function() refreshGeneral,
  }) {
    return loadGeneral();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadGeneral,
    TResult? Function(int month, int year)? loadMonthlySpending,
    TResult? Function()? refreshGeneral,
  }) {
    return loadGeneral?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadGeneral,
    TResult Function(int month, int year)? loadMonthlySpending,
    TResult Function()? refreshGeneral,
    required TResult orElse(),
  }) {
    if (loadGeneral != null) {
      return loadGeneral();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGeneral value) loadGeneral,
    required TResult Function(_LoadMonthlySpending value) loadMonthlySpending,
    required TResult Function(_RefreshGeneral value) refreshGeneral,
  }) {
    return loadGeneral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadGeneral value)? loadGeneral,
    TResult? Function(_LoadMonthlySpending value)? loadMonthlySpending,
    TResult? Function(_RefreshGeneral value)? refreshGeneral,
  }) {
    return loadGeneral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGeneral value)? loadGeneral,
    TResult Function(_LoadMonthlySpending value)? loadMonthlySpending,
    TResult Function(_RefreshGeneral value)? refreshGeneral,
    required TResult orElse(),
  }) {
    if (loadGeneral != null) {
      return loadGeneral(this);
    }
    return orElse();
  }
}

abstract class _LoadGeneral implements GeneralEvent {
  const factory _LoadGeneral() = _$LoadGeneralImpl;
}

/// @nodoc
abstract class _$$LoadMonthlySpendingImplCopyWith<$Res> {
  factory _$$LoadMonthlySpendingImplCopyWith(_$LoadMonthlySpendingImpl value,
          $Res Function(_$LoadMonthlySpendingImpl) then) =
      __$$LoadMonthlySpendingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int month, int year});
}

/// @nodoc
class __$$LoadMonthlySpendingImplCopyWithImpl<$Res>
    extends _$GeneralEventCopyWithImpl<$Res, _$LoadMonthlySpendingImpl>
    implements _$$LoadMonthlySpendingImplCopyWith<$Res> {
  __$$LoadMonthlySpendingImplCopyWithImpl(_$LoadMonthlySpendingImpl _value,
      $Res Function(_$LoadMonthlySpendingImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? year = null,
  }) {
    return _then(_$LoadMonthlySpendingImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as int,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$LoadMonthlySpendingImpl implements _LoadMonthlySpending {
  const _$LoadMonthlySpendingImpl({required this.month, required this.year});

  @override
  final int month;
  @override
  final int year;

  @override
  String toString() {
    return 'GeneralEvent.loadMonthlySpending(month: $month, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMonthlySpendingImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.year, year) || other.year == year));
  }

  @override
  int get hashCode => Object.hash(runtimeType, month, year);

  /// Create a copy of GeneralEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadMonthlySpendingImplCopyWith<_$LoadMonthlySpendingImpl> get copyWith =>
      __$$LoadMonthlySpendingImplCopyWithImpl<_$LoadMonthlySpendingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadGeneral,
    required TResult Function(int month, int year) loadMonthlySpending,
    required TResult Function() refreshGeneral,
  }) {
    return loadMonthlySpending(month, year);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadGeneral,
    TResult? Function(int month, int year)? loadMonthlySpending,
    TResult? Function()? refreshGeneral,
  }) {
    return loadMonthlySpending?.call(month, year);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadGeneral,
    TResult Function(int month, int year)? loadMonthlySpending,
    TResult Function()? refreshGeneral,
    required TResult orElse(),
  }) {
    if (loadMonthlySpending != null) {
      return loadMonthlySpending(month, year);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGeneral value) loadGeneral,
    required TResult Function(_LoadMonthlySpending value) loadMonthlySpending,
    required TResult Function(_RefreshGeneral value) refreshGeneral,
  }) {
    return loadMonthlySpending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadGeneral value)? loadGeneral,
    TResult? Function(_LoadMonthlySpending value)? loadMonthlySpending,
    TResult? Function(_RefreshGeneral value)? refreshGeneral,
  }) {
    return loadMonthlySpending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGeneral value)? loadGeneral,
    TResult Function(_LoadMonthlySpending value)? loadMonthlySpending,
    TResult Function(_RefreshGeneral value)? refreshGeneral,
    required TResult orElse(),
  }) {
    if (loadMonthlySpending != null) {
      return loadMonthlySpending(this);
    }
    return orElse();
  }
}

abstract class _LoadMonthlySpending implements GeneralEvent {
  const factory _LoadMonthlySpending(
      {required final int month,
      required final int year}) = _$LoadMonthlySpendingImpl;

  int get month;
  int get year;

  /// Create a copy of GeneralEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadMonthlySpendingImplCopyWith<_$LoadMonthlySpendingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RefreshGeneralImplCopyWith<$Res> {
  factory _$$RefreshGeneralImplCopyWith(_$RefreshGeneralImpl value,
          $Res Function(_$RefreshGeneralImpl) then) =
      __$$RefreshGeneralImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshGeneralImplCopyWithImpl<$Res>
    extends _$GeneralEventCopyWithImpl<$Res, _$RefreshGeneralImpl>
    implements _$$RefreshGeneralImplCopyWith<$Res> {
  __$$RefreshGeneralImplCopyWithImpl(
      _$RefreshGeneralImpl _value, $Res Function(_$RefreshGeneralImpl) _then)
      : super(_value, _then);

  /// Create a copy of GeneralEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshGeneralImpl implements _RefreshGeneral {
  const _$RefreshGeneralImpl();

  @override
  String toString() {
    return 'GeneralEvent.refreshGeneral()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshGeneralImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadGeneral,
    required TResult Function(int month, int year) loadMonthlySpending,
    required TResult Function() refreshGeneral,
  }) {
    return refreshGeneral();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadGeneral,
    TResult? Function(int month, int year)? loadMonthlySpending,
    TResult? Function()? refreshGeneral,
  }) {
    return refreshGeneral?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadGeneral,
    TResult Function(int month, int year)? loadMonthlySpending,
    TResult Function()? refreshGeneral,
    required TResult orElse(),
  }) {
    if (refreshGeneral != null) {
      return refreshGeneral();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_LoadGeneral value) loadGeneral,
    required TResult Function(_LoadMonthlySpending value) loadMonthlySpending,
    required TResult Function(_RefreshGeneral value) refreshGeneral,
  }) {
    return refreshGeneral(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_LoadGeneral value)? loadGeneral,
    TResult? Function(_LoadMonthlySpending value)? loadMonthlySpending,
    TResult? Function(_RefreshGeneral value)? refreshGeneral,
  }) {
    return refreshGeneral?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_LoadGeneral value)? loadGeneral,
    TResult Function(_LoadMonthlySpending value)? loadMonthlySpending,
    TResult Function(_RefreshGeneral value)? refreshGeneral,
    required TResult orElse(),
  }) {
    if (refreshGeneral != null) {
      return refreshGeneral(this);
    }
    return orElse();
  }
}

abstract class _RefreshGeneral implements GeneralEvent {
  const factory _RefreshGeneral() = _$RefreshGeneralImpl;
}
