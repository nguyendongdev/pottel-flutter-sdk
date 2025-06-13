// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ekyc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ekyc _$EkycFromJson(Map<String, dynamic> json) {
  return _Ekyc.fromJson(json);
}

/// @nodoc
mixin _$Ekyc {
  String? get cartBack => throw _privateConstructorUsedError;
  String? get cartFront => throw _privateConstructorUsedError;
  String? get selfie => throw _privateConstructorUsedError;

  /// Serializes this Ekyc to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ekyc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EkycCopyWith<Ekyc> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EkycCopyWith<$Res> {
  factory $EkycCopyWith(Ekyc value, $Res Function(Ekyc) then) =
      _$EkycCopyWithImpl<$Res, Ekyc>;
  @useResult
  $Res call({String? cartBack, String? cartFront, String? selfie});
}

/// @nodoc
class _$EkycCopyWithImpl<$Res, $Val extends Ekyc>
    implements $EkycCopyWith<$Res> {
  _$EkycCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ekyc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartBack = freezed,
    Object? cartFront = freezed,
    Object? selfie = freezed,
  }) {
    return _then(_value.copyWith(
      cartBack: freezed == cartBack
          ? _value.cartBack
          : cartBack // ignore: cast_nullable_to_non_nullable
              as String?,
      cartFront: freezed == cartFront
          ? _value.cartFront
          : cartFront // ignore: cast_nullable_to_non_nullable
              as String?,
      selfie: freezed == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EkycImplCopyWith<$Res> implements $EkycCopyWith<$Res> {
  factory _$$EkycImplCopyWith(
          _$EkycImpl value, $Res Function(_$EkycImpl) then) =
      __$$EkycImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? cartBack, String? cartFront, String? selfie});
}

/// @nodoc
class __$$EkycImplCopyWithImpl<$Res>
    extends _$EkycCopyWithImpl<$Res, _$EkycImpl>
    implements _$$EkycImplCopyWith<$Res> {
  __$$EkycImplCopyWithImpl(_$EkycImpl _value, $Res Function(_$EkycImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ekyc
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartBack = freezed,
    Object? cartFront = freezed,
    Object? selfie = freezed,
  }) {
    return _then(_$EkycImpl(
      cartBack: freezed == cartBack
          ? _value.cartBack
          : cartBack // ignore: cast_nullable_to_non_nullable
              as String?,
      cartFront: freezed == cartFront
          ? _value.cartFront
          : cartFront // ignore: cast_nullable_to_non_nullable
              as String?,
      selfie: freezed == selfie
          ? _value.selfie
          : selfie // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EkycImpl implements _Ekyc {
  const _$EkycImpl({this.cartBack, this.cartFront, this.selfie});

  factory _$EkycImpl.fromJson(Map<String, dynamic> json) =>
      _$$EkycImplFromJson(json);

  @override
  final String? cartBack;
  @override
  final String? cartFront;
  @override
  final String? selfie;

  @override
  String toString() {
    return 'Ekyc(cartBack: $cartBack, cartFront: $cartFront, selfie: $selfie)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EkycImpl &&
            (identical(other.cartBack, cartBack) ||
                other.cartBack == cartBack) &&
            (identical(other.cartFront, cartFront) ||
                other.cartFront == cartFront) &&
            (identical(other.selfie, selfie) || other.selfie == selfie));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, cartBack, cartFront, selfie);

  /// Create a copy of Ekyc
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EkycImplCopyWith<_$EkycImpl> get copyWith =>
      __$$EkycImplCopyWithImpl<_$EkycImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EkycImplToJson(
      this,
    );
  }
}

abstract class _Ekyc implements Ekyc {
  const factory _Ekyc(
      {final String? cartBack,
      final String? cartFront,
      final String? selfie}) = _$EkycImpl;

  factory _Ekyc.fromJson(Map<String, dynamic> json) = _$EkycImpl.fromJson;

  @override
  String? get cartBack;
  @override
  String? get cartFront;
  @override
  String? get selfie;

  /// Create a copy of Ekyc
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EkycImplCopyWith<_$EkycImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
