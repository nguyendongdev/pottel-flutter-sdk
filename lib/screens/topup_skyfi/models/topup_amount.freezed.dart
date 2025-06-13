// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topup_amount.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TopupAmount {
  int get amount => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;

  /// Create a copy of TopupAmount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TopupAmountCopyWith<TopupAmount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopupAmountCopyWith<$Res> {
  factory $TopupAmountCopyWith(
          TopupAmount value, $Res Function(TopupAmount) then) =
      _$TopupAmountCopyWithImpl<$Res, TopupAmount>;
  @useResult
  $Res call({int amount, bool isSelected});
}

/// @nodoc
class _$TopupAmountCopyWithImpl<$Res, $Val extends TopupAmount>
    implements $TopupAmountCopyWith<$Res> {
  _$TopupAmountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TopupAmount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TopupAmountImplCopyWith<$Res>
    implements $TopupAmountCopyWith<$Res> {
  factory _$$TopupAmountImplCopyWith(
          _$TopupAmountImpl value, $Res Function(_$TopupAmountImpl) then) =
      __$$TopupAmountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int amount, bool isSelected});
}

/// @nodoc
class __$$TopupAmountImplCopyWithImpl<$Res>
    extends _$TopupAmountCopyWithImpl<$Res, _$TopupAmountImpl>
    implements _$$TopupAmountImplCopyWith<$Res> {
  __$$TopupAmountImplCopyWithImpl(
      _$TopupAmountImpl _value, $Res Function(_$TopupAmountImpl) _then)
      : super(_value, _then);

  /// Create a copy of TopupAmount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? isSelected = null,
  }) {
    return _then(_$TopupAmountImpl(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TopupAmountImpl implements _TopupAmount {
  const _$TopupAmountImpl({required this.amount, this.isSelected = false});

  @override
  final int amount;
  @override
  @JsonKey()
  final bool isSelected;

  @override
  String toString() {
    return 'TopupAmount(amount: $amount, isSelected: $isSelected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TopupAmountImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.isSelected, isSelected) ||
                other.isSelected == isSelected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, isSelected);

  /// Create a copy of TopupAmount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TopupAmountImplCopyWith<_$TopupAmountImpl> get copyWith =>
      __$$TopupAmountImplCopyWithImpl<_$TopupAmountImpl>(this, _$identity);
}

abstract class _TopupAmount implements TopupAmount {
  const factory _TopupAmount(
      {required final int amount, final bool isSelected}) = _$TopupAmountImpl;

  @override
  int get amount;
  @override
  bool get isSelected;

  /// Create a copy of TopupAmount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TopupAmountImplCopyWith<_$TopupAmountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
