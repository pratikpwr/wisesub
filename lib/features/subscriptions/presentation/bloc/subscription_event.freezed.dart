// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscription_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscriptionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionEventCopyWith<$Res> {
  factory $SubscriptionEventCopyWith(
          SubscriptionEvent value, $Res Function(SubscriptionEvent) then) =
      _$SubscriptionEventCopyWithImpl<$Res, SubscriptionEvent>;
}

/// @nodoc
class _$SubscriptionEventCopyWithImpl<$Res, $Val extends SubscriptionEvent>
    implements $SubscriptionEventCopyWith<$Res> {
  _$SubscriptionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddCategoryImplCopyWith<$Res> {
  factory _$$AddCategoryImplCopyWith(
          _$AddCategoryImpl value, $Res Function(_$AddCategoryImpl) then) =
      __$$AddCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category});
}

/// @nodoc
class __$$AddCategoryImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$AddCategoryImpl>
    implements _$$AddCategoryImplCopyWith<$Res> {
  __$$AddCategoryImplCopyWithImpl(
      _$AddCategoryImpl _value, $Res Function(_$AddCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$AddCategoryImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$AddCategoryImpl implements _AddCategory {
  const _$AddCategoryImpl(this.category);

  @override
  final Category category;

  @override
  String toString() {
    return 'SubscriptionEvent.addCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddCategoryImplCopyWith<_$AddCategoryImpl> get copyWith =>
      __$$AddCategoryImplCopyWithImpl<_$AddCategoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return addCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return addCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (addCategory != null) {
      return addCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return addCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return addCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (addCategory != null) {
      return addCategory(this);
    }
    return orElse();
  }
}

abstract class _AddCategory implements SubscriptionEvent {
  const factory _AddCategory(final Category category) = _$AddCategoryImpl;

  Category get category;

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddCategoryImplCopyWith<_$AddCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddSubscriptionImplCopyWith<$Res> {
  factory _$$AddSubscriptionImplCopyWith(_$AddSubscriptionImpl value,
          $Res Function(_$AddSubscriptionImpl) then) =
      __$$AddSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Subscription subscription});
}

/// @nodoc
class __$$AddSubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$AddSubscriptionImpl>
    implements _$$AddSubscriptionImplCopyWith<$Res> {
  __$$AddSubscriptionImplCopyWithImpl(
      _$AddSubscriptionImpl _value, $Res Function(_$AddSubscriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
  }) {
    return _then(_$AddSubscriptionImpl(
      null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Subscription,
    ));
  }
}

/// @nodoc

class _$AddSubscriptionImpl implements _AddSubscription {
  const _$AddSubscriptionImpl(this.subscription);

  @override
  final Subscription subscription;

  @override
  String toString() {
    return 'SubscriptionEvent.addSubscription(subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddSubscriptionImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddSubscriptionImplCopyWith<_$AddSubscriptionImpl> get copyWith =>
      __$$AddSubscriptionImplCopyWithImpl<_$AddSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return addSubscription(subscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return addSubscription?.call(subscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (addSubscription != null) {
      return addSubscription(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return addSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return addSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (addSubscription != null) {
      return addSubscription(this);
    }
    return orElse();
  }
}

abstract class _AddSubscription implements SubscriptionEvent {
  const factory _AddSubscription(final Subscription subscription) =
      _$AddSubscriptionImpl;

  Subscription get subscription;

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddSubscriptionImplCopyWith<_$AddSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteCategoryImplCopyWith<$Res> {
  factory _$$DeleteCategoryImplCopyWith(_$DeleteCategoryImpl value,
          $Res Function(_$DeleteCategoryImpl) then) =
      __$$DeleteCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteCategoryImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$DeleteCategoryImpl>
    implements _$$DeleteCategoryImplCopyWith<$Res> {
  __$$DeleteCategoryImplCopyWithImpl(
      _$DeleteCategoryImpl _value, $Res Function(_$DeleteCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteCategoryImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteCategoryImpl implements _DeleteCategory {
  const _$DeleteCategoryImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'SubscriptionEvent.deleteCategory(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteCategoryImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteCategoryImplCopyWith<_$DeleteCategoryImpl> get copyWith =>
      __$$DeleteCategoryImplCopyWithImpl<_$DeleteCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return deleteCategory(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return deleteCategory?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (deleteCategory != null) {
      return deleteCategory(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return deleteCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return deleteCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (deleteCategory != null) {
      return deleteCategory(this);
    }
    return orElse();
  }
}

abstract class _DeleteCategory implements SubscriptionEvent {
  const factory _DeleteCategory(final String id) = _$DeleteCategoryImpl;

  String get id;

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteCategoryImplCopyWith<_$DeleteCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteSubscriptionImplCopyWith<$Res> {
  factory _$$DeleteSubscriptionImplCopyWith(_$DeleteSubscriptionImpl value,
          $Res Function(_$DeleteSubscriptionImpl) then) =
      __$$DeleteSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteSubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$DeleteSubscriptionImpl>
    implements _$$DeleteSubscriptionImplCopyWith<$Res> {
  __$$DeleteSubscriptionImplCopyWithImpl(_$DeleteSubscriptionImpl _value,
      $Res Function(_$DeleteSubscriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteSubscriptionImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteSubscriptionImpl implements _DeleteSubscription {
  const _$DeleteSubscriptionImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'SubscriptionEvent.deleteSubscription(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteSubscriptionImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteSubscriptionImplCopyWith<_$DeleteSubscriptionImpl> get copyWith =>
      __$$DeleteSubscriptionImplCopyWithImpl<_$DeleteSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return deleteSubscription(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return deleteSubscription?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (deleteSubscription != null) {
      return deleteSubscription(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return deleteSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return deleteSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (deleteSubscription != null) {
      return deleteSubscription(this);
    }
    return orElse();
  }
}

abstract class _DeleteSubscription implements SubscriptionEvent {
  const factory _DeleteSubscription(final String id) = _$DeleteSubscriptionImpl;

  String get id;

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteSubscriptionImplCopyWith<_$DeleteSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterByCategoryImplCopyWith<$Res> {
  factory _$$FilterByCategoryImplCopyWith(_$FilterByCategoryImpl value,
          $Res Function(_$FilterByCategoryImpl) then) =
      __$$FilterByCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? categoryId});
}

/// @nodoc
class __$$FilterByCategoryImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$FilterByCategoryImpl>
    implements _$$FilterByCategoryImplCopyWith<$Res> {
  __$$FilterByCategoryImplCopyWithImpl(_$FilterByCategoryImpl _value,
      $Res Function(_$FilterByCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = freezed,
  }) {
    return _then(_$FilterByCategoryImpl(
      freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FilterByCategoryImpl implements _FilterByCategory {
  const _$FilterByCategoryImpl(this.categoryId);

  @override
  final String? categoryId;

  @override
  String toString() {
    return 'SubscriptionEvent.filterByCategory(categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterByCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, categoryId);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      __$$FilterByCategoryImplCopyWithImpl<_$FilterByCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return filterByCategory(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return filterByCategory?.call(categoryId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(categoryId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return filterByCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return filterByCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (filterByCategory != null) {
      return filterByCategory(this);
    }
    return orElse();
  }
}

abstract class _FilterByCategory implements SubscriptionEvent {
  const factory _FilterByCategory(final String? categoryId) =
      _$FilterByCategoryImpl;

  String? get categoryId;

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterByCategoryImplCopyWith<_$FilterByCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadCategoriesImplCopyWith<$Res> {
  factory _$$LoadCategoriesImplCopyWith(_$LoadCategoriesImpl value,
          $Res Function(_$LoadCategoriesImpl) then) =
      __$$LoadCategoriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCategoriesImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$LoadCategoriesImpl>
    implements _$$LoadCategoriesImplCopyWith<$Res> {
  __$$LoadCategoriesImplCopyWithImpl(
      _$LoadCategoriesImpl _value, $Res Function(_$LoadCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadCategoriesImpl implements _LoadCategories {
  const _$LoadCategoriesImpl();

  @override
  String toString() {
    return 'SubscriptionEvent.loadCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCategoriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return loadCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return loadCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (loadCategories != null) {
      return loadCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return loadCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return loadCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (loadCategories != null) {
      return loadCategories(this);
    }
    return orElse();
  }
}

abstract class _LoadCategories implements SubscriptionEvent {
  const factory _LoadCategories() = _$LoadCategoriesImpl;
}

/// @nodoc
abstract class _$$LoadSubscriptionsImplCopyWith<$Res> {
  factory _$$LoadSubscriptionsImplCopyWith(_$LoadSubscriptionsImpl value,
          $Res Function(_$LoadSubscriptionsImpl) then) =
      __$$LoadSubscriptionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadSubscriptionsImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$LoadSubscriptionsImpl>
    implements _$$LoadSubscriptionsImplCopyWith<$Res> {
  __$$LoadSubscriptionsImplCopyWithImpl(_$LoadSubscriptionsImpl _value,
      $Res Function(_$LoadSubscriptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadSubscriptionsImpl implements _LoadSubscriptions {
  const _$LoadSubscriptionsImpl();

  @override
  String toString() {
    return 'SubscriptionEvent.loadSubscriptions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadSubscriptionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return loadSubscriptions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return loadSubscriptions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (loadSubscriptions != null) {
      return loadSubscriptions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return loadSubscriptions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return loadSubscriptions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (loadSubscriptions != null) {
      return loadSubscriptions(this);
    }
    return orElse();
  }
}

abstract class _LoadSubscriptions implements SubscriptionEvent {
  const factory _LoadSubscriptions() = _$LoadSubscriptionsImpl;
}

/// @nodoc
abstract class _$$UpdateCategoryImplCopyWith<$Res> {
  factory _$$UpdateCategoryImplCopyWith(_$UpdateCategoryImpl value,
          $Res Function(_$UpdateCategoryImpl) then) =
      __$$UpdateCategoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Category category});
}

/// @nodoc
class __$$UpdateCategoryImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$UpdateCategoryImpl>
    implements _$$UpdateCategoryImplCopyWith<$Res> {
  __$$UpdateCategoryImplCopyWithImpl(
      _$UpdateCategoryImpl _value, $Res Function(_$UpdateCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$UpdateCategoryImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
    ));
  }
}

/// @nodoc

class _$UpdateCategoryImpl implements _UpdateCategory {
  const _$UpdateCategoryImpl(this.category);

  @override
  final Category category;

  @override
  String toString() {
    return 'SubscriptionEvent.updateCategory(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateCategoryImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateCategoryImplCopyWith<_$UpdateCategoryImpl> get copyWith =>
      __$$UpdateCategoryImplCopyWithImpl<_$UpdateCategoryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return updateCategory(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return updateCategory?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (updateCategory != null) {
      return updateCategory(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return updateCategory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return updateCategory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (updateCategory != null) {
      return updateCategory(this);
    }
    return orElse();
  }
}

abstract class _UpdateCategory implements SubscriptionEvent {
  const factory _UpdateCategory(final Category category) = _$UpdateCategoryImpl;

  Category get category;

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateCategoryImplCopyWith<_$UpdateCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSubscriptionImplCopyWith<$Res> {
  factory _$$UpdateSubscriptionImplCopyWith(_$UpdateSubscriptionImpl value,
          $Res Function(_$UpdateSubscriptionImpl) then) =
      __$$UpdateSubscriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Subscription subscription});
}

/// @nodoc
class __$$UpdateSubscriptionImplCopyWithImpl<$Res>
    extends _$SubscriptionEventCopyWithImpl<$Res, _$UpdateSubscriptionImpl>
    implements _$$UpdateSubscriptionImplCopyWith<$Res> {
  __$$UpdateSubscriptionImplCopyWithImpl(_$UpdateSubscriptionImpl _value,
      $Res Function(_$UpdateSubscriptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscription = null,
  }) {
    return _then(_$UpdateSubscriptionImpl(
      null == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as Subscription,
    ));
  }
}

/// @nodoc

class _$UpdateSubscriptionImpl implements _UpdateSubscription {
  const _$UpdateSubscriptionImpl(this.subscription);

  @override
  final Subscription subscription;

  @override
  String toString() {
    return 'SubscriptionEvent.updateSubscription(subscription: $subscription)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSubscriptionImpl &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subscription);

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSubscriptionImplCopyWith<_$UpdateSubscriptionImpl> get copyWith =>
      __$$UpdateSubscriptionImplCopyWithImpl<_$UpdateSubscriptionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Category category) addCategory,
    required TResult Function(Subscription subscription) addSubscription,
    required TResult Function(String id) deleteCategory,
    required TResult Function(String id) deleteSubscription,
    required TResult Function(String? categoryId) filterByCategory,
    required TResult Function() loadCategories,
    required TResult Function() loadSubscriptions,
    required TResult Function(Category category) updateCategory,
    required TResult Function(Subscription subscription) updateSubscription,
  }) {
    return updateSubscription(subscription);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Category category)? addCategory,
    TResult? Function(Subscription subscription)? addSubscription,
    TResult? Function(String id)? deleteCategory,
    TResult? Function(String id)? deleteSubscription,
    TResult? Function(String? categoryId)? filterByCategory,
    TResult? Function()? loadCategories,
    TResult? Function()? loadSubscriptions,
    TResult? Function(Category category)? updateCategory,
    TResult? Function(Subscription subscription)? updateSubscription,
  }) {
    return updateSubscription?.call(subscription);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Category category)? addCategory,
    TResult Function(Subscription subscription)? addSubscription,
    TResult Function(String id)? deleteCategory,
    TResult Function(String id)? deleteSubscription,
    TResult Function(String? categoryId)? filterByCategory,
    TResult Function()? loadCategories,
    TResult Function()? loadSubscriptions,
    TResult Function(Category category)? updateCategory,
    TResult Function(Subscription subscription)? updateSubscription,
    required TResult orElse(),
  }) {
    if (updateSubscription != null) {
      return updateSubscription(subscription);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddCategory value) addCategory,
    required TResult Function(_AddSubscription value) addSubscription,
    required TResult Function(_DeleteCategory value) deleteCategory,
    required TResult Function(_DeleteSubscription value) deleteSubscription,
    required TResult Function(_FilterByCategory value) filterByCategory,
    required TResult Function(_LoadCategories value) loadCategories,
    required TResult Function(_LoadSubscriptions value) loadSubscriptions,
    required TResult Function(_UpdateCategory value) updateCategory,
    required TResult Function(_UpdateSubscription value) updateSubscription,
  }) {
    return updateSubscription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddCategory value)? addCategory,
    TResult? Function(_AddSubscription value)? addSubscription,
    TResult? Function(_DeleteCategory value)? deleteCategory,
    TResult? Function(_DeleteSubscription value)? deleteSubscription,
    TResult? Function(_FilterByCategory value)? filterByCategory,
    TResult? Function(_LoadCategories value)? loadCategories,
    TResult? Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult? Function(_UpdateCategory value)? updateCategory,
    TResult? Function(_UpdateSubscription value)? updateSubscription,
  }) {
    return updateSubscription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddCategory value)? addCategory,
    TResult Function(_AddSubscription value)? addSubscription,
    TResult Function(_DeleteCategory value)? deleteCategory,
    TResult Function(_DeleteSubscription value)? deleteSubscription,
    TResult Function(_FilterByCategory value)? filterByCategory,
    TResult Function(_LoadCategories value)? loadCategories,
    TResult Function(_LoadSubscriptions value)? loadSubscriptions,
    TResult Function(_UpdateCategory value)? updateCategory,
    TResult Function(_UpdateSubscription value)? updateSubscription,
    required TResult orElse(),
  }) {
    if (updateSubscription != null) {
      return updateSubscription(this);
    }
    return orElse();
  }
}

abstract class _UpdateSubscription implements SubscriptionEvent {
  const factory _UpdateSubscription(final Subscription subscription) =
      _$UpdateSubscriptionImpl;

  Subscription get subscription;

  /// Create a copy of SubscriptionEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSubscriptionImplCopyWith<_$UpdateSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
