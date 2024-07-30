// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepositStatus _$DepositStatusFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'waitingForBTC':
      return DepositWaitingForBTC.fromJson(json);
    case 'waitingForRedemption':
      return _waitingForRedemption.fromJson(json);
    case 'waitingForClaim':
      return DepositWaitingForClaim.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DepositStatus',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DepositStatus {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitingForBTC,
    required TResult Function(
            String address, String bridgePKey, String redeemScript)
        waitingForRedemption,
    required TResult Function() waitingForClaim,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitingForBTC,
    TResult? Function(String address, String bridgePKey, String redeemScript)?
        waitingForRedemption,
    TResult? Function()? waitingForClaim,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitingForBTC,
    TResult Function(String address, String bridgePKey, String redeemScript)?
        waitingForRedemption,
    TResult Function()? waitingForClaim,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DepositWaitingForBTC value) waitingForBTC,
    required TResult Function(_waitingForRedemption value) waitingForRedemption,
    required TResult Function(DepositWaitingForClaim value) waitingForClaim,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DepositWaitingForBTC value)? waitingForBTC,
    TResult? Function(_waitingForRedemption value)? waitingForRedemption,
    TResult? Function(DepositWaitingForClaim value)? waitingForClaim,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DepositWaitingForBTC value)? waitingForBTC,
    TResult Function(_waitingForRedemption value)? waitingForRedemption,
    TResult Function(DepositWaitingForClaim value)? waitingForClaim,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepositStatusCopyWith<$Res> {
  factory $DepositStatusCopyWith(
          DepositStatus value, $Res Function(DepositStatus) then) =
      _$DepositStatusCopyWithImpl<$Res, DepositStatus>;
}

/// @nodoc
class _$DepositStatusCopyWithImpl<$Res, $Val extends DepositStatus>
    implements $DepositStatusCopyWith<$Res> {
  _$DepositStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DepositWaitingForBTCImplCopyWith<$Res> {
  factory _$$DepositWaitingForBTCImplCopyWith(_$DepositWaitingForBTCImpl value,
          $Res Function(_$DepositWaitingForBTCImpl) then) =
      __$$DepositWaitingForBTCImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DepositWaitingForBTCImplCopyWithImpl<$Res>
    extends _$DepositStatusCopyWithImpl<$Res, _$DepositWaitingForBTCImpl>
    implements _$$DepositWaitingForBTCImplCopyWith<$Res> {
  __$$DepositWaitingForBTCImplCopyWithImpl(_$DepositWaitingForBTCImpl _value,
      $Res Function(_$DepositWaitingForBTCImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$DepositWaitingForBTCImpl implements DepositWaitingForBTC {
  const _$DepositWaitingForBTCImpl({final String? $type})
      : $type = $type ?? 'waitingForBTC';

  factory _$DepositWaitingForBTCImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositWaitingForBTCImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DepositStatus.waitingForBTC()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositWaitingForBTCImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitingForBTC,
    required TResult Function(
            String address, String bridgePKey, String redeemScript)
        waitingForRedemption,
    required TResult Function() waitingForClaim,
  }) {
    return waitingForBTC();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitingForBTC,
    TResult? Function(String address, String bridgePKey, String redeemScript)?
        waitingForRedemption,
    TResult? Function()? waitingForClaim,
  }) {
    return waitingForBTC?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitingForBTC,
    TResult Function(String address, String bridgePKey, String redeemScript)?
        waitingForRedemption,
    TResult Function()? waitingForClaim,
    required TResult orElse(),
  }) {
    if (waitingForBTC != null) {
      return waitingForBTC();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DepositWaitingForBTC value) waitingForBTC,
    required TResult Function(_waitingForRedemption value) waitingForRedemption,
    required TResult Function(DepositWaitingForClaim value) waitingForClaim,
  }) {
    return waitingForBTC(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DepositWaitingForBTC value)? waitingForBTC,
    TResult? Function(_waitingForRedemption value)? waitingForRedemption,
    TResult? Function(DepositWaitingForClaim value)? waitingForClaim,
  }) {
    return waitingForBTC?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DepositWaitingForBTC value)? waitingForBTC,
    TResult Function(_waitingForRedemption value)? waitingForRedemption,
    TResult Function(DepositWaitingForClaim value)? waitingForClaim,
    required TResult orElse(),
  }) {
    if (waitingForBTC != null) {
      return waitingForBTC(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositWaitingForBTCImplToJson(
      this,
    );
  }
}

abstract class DepositWaitingForBTC implements DepositStatus {
  const factory DepositWaitingForBTC() = _$DepositWaitingForBTCImpl;

  factory DepositWaitingForBTC.fromJson(Map<String, dynamic> json) =
      _$DepositWaitingForBTCImpl.fromJson;
}

/// @nodoc
abstract class _$$waitingForRedemptionImplCopyWith<$Res> {
  factory _$$waitingForRedemptionImplCopyWith(_$waitingForRedemptionImpl value,
          $Res Function(_$waitingForRedemptionImpl) then) =
      __$$waitingForRedemptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String address, String bridgePKey, String redeemScript});
}

/// @nodoc
class __$$waitingForRedemptionImplCopyWithImpl<$Res>
    extends _$DepositStatusCopyWithImpl<$Res, _$waitingForRedemptionImpl>
    implements _$$waitingForRedemptionImplCopyWith<$Res> {
  __$$waitingForRedemptionImplCopyWithImpl(_$waitingForRedemptionImpl _value,
      $Res Function(_$waitingForRedemptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? bridgePKey = null,
    Object? redeemScript = null,
  }) {
    return _then(_$waitingForRedemptionImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      bridgePKey: null == bridgePKey
          ? _value.bridgePKey
          : bridgePKey // ignore: cast_nullable_to_non_nullable
              as String,
      redeemScript: null == redeemScript
          ? _value.redeemScript
          : redeemScript // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$waitingForRedemptionImpl implements _waitingForRedemption {
  const _$waitingForRedemptionImpl(
      {required this.address,
      required this.bridgePKey,
      required this.redeemScript,
      final String? $type})
      : $type = $type ?? 'waitingForRedemption';

  factory _$waitingForRedemptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$waitingForRedemptionImplFromJson(json);

  @override
  final String address;
  @override
  final String bridgePKey;
  @override
  final String redeemScript;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DepositStatus.waitingForRedemption(address: $address, bridgePKey: $bridgePKey, redeemScript: $redeemScript)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$waitingForRedemptionImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.bridgePKey, bridgePKey) ||
                other.bridgePKey == bridgePKey) &&
            (identical(other.redeemScript, redeemScript) ||
                other.redeemScript == redeemScript));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, address, bridgePKey, redeemScript);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$waitingForRedemptionImplCopyWith<_$waitingForRedemptionImpl>
      get copyWith =>
          __$$waitingForRedemptionImplCopyWithImpl<_$waitingForRedemptionImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitingForBTC,
    required TResult Function(
            String address, String bridgePKey, String redeemScript)
        waitingForRedemption,
    required TResult Function() waitingForClaim,
  }) {
    return waitingForRedemption(address, bridgePKey, redeemScript);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitingForBTC,
    TResult? Function(String address, String bridgePKey, String redeemScript)?
        waitingForRedemption,
    TResult? Function()? waitingForClaim,
  }) {
    return waitingForRedemption?.call(address, bridgePKey, redeemScript);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitingForBTC,
    TResult Function(String address, String bridgePKey, String redeemScript)?
        waitingForRedemption,
    TResult Function()? waitingForClaim,
    required TResult orElse(),
  }) {
    if (waitingForRedemption != null) {
      return waitingForRedemption(address, bridgePKey, redeemScript);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DepositWaitingForBTC value) waitingForBTC,
    required TResult Function(_waitingForRedemption value) waitingForRedemption,
    required TResult Function(DepositWaitingForClaim value) waitingForClaim,
  }) {
    return waitingForRedemption(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DepositWaitingForBTC value)? waitingForBTC,
    TResult? Function(_waitingForRedemption value)? waitingForRedemption,
    TResult? Function(DepositWaitingForClaim value)? waitingForClaim,
  }) {
    return waitingForRedemption?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DepositWaitingForBTC value)? waitingForBTC,
    TResult Function(_waitingForRedemption value)? waitingForRedemption,
    TResult Function(DepositWaitingForClaim value)? waitingForClaim,
    required TResult orElse(),
  }) {
    if (waitingForRedemption != null) {
      return waitingForRedemption(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$waitingForRedemptionImplToJson(
      this,
    );
  }
}

abstract class _waitingForRedemption implements DepositStatus {
  const factory _waitingForRedemption(
      {required final String address,
      required final String bridgePKey,
      required final String redeemScript}) = _$waitingForRedemptionImpl;

  factory _waitingForRedemption.fromJson(Map<String, dynamic> json) =
      _$waitingForRedemptionImpl.fromJson;

  String get address;
  String get bridgePKey;
  String get redeemScript;
  @JsonKey(ignore: true)
  _$$waitingForRedemptionImplCopyWith<_$waitingForRedemptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DepositWaitingForClaimImplCopyWith<$Res> {
  factory _$$DepositWaitingForClaimImplCopyWith(
          _$DepositWaitingForClaimImpl value,
          $Res Function(_$DepositWaitingForClaimImpl) then) =
      __$$DepositWaitingForClaimImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DepositWaitingForClaimImplCopyWithImpl<$Res>
    extends _$DepositStatusCopyWithImpl<$Res, _$DepositWaitingForClaimImpl>
    implements _$$DepositWaitingForClaimImplCopyWith<$Res> {
  __$$DepositWaitingForClaimImplCopyWithImpl(
      _$DepositWaitingForClaimImpl _value,
      $Res Function(_$DepositWaitingForClaimImpl) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$DepositWaitingForClaimImpl implements DepositWaitingForClaim {
  const _$DepositWaitingForClaimImpl({final String? $type})
      : $type = $type ?? 'waitingForClaim';

  factory _$DepositWaitingForClaimImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepositWaitingForClaimImplFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DepositStatus.waitingForClaim()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepositWaitingForClaimImpl);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() waitingForBTC,
    required TResult Function(
            String address, String bridgePKey, String redeemScript)
        waitingForRedemption,
    required TResult Function() waitingForClaim,
  }) {
    return waitingForClaim();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? waitingForBTC,
    TResult? Function(String address, String bridgePKey, String redeemScript)?
        waitingForRedemption,
    TResult? Function()? waitingForClaim,
  }) {
    return waitingForClaim?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? waitingForBTC,
    TResult Function(String address, String bridgePKey, String redeemScript)?
        waitingForRedemption,
    TResult Function()? waitingForClaim,
    required TResult orElse(),
  }) {
    if (waitingForClaim != null) {
      return waitingForClaim();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DepositWaitingForBTC value) waitingForBTC,
    required TResult Function(_waitingForRedemption value) waitingForRedemption,
    required TResult Function(DepositWaitingForClaim value) waitingForClaim,
  }) {
    return waitingForClaim(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DepositWaitingForBTC value)? waitingForBTC,
    TResult? Function(_waitingForRedemption value)? waitingForRedemption,
    TResult? Function(DepositWaitingForClaim value)? waitingForClaim,
  }) {
    return waitingForClaim?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DepositWaitingForBTC value)? waitingForBTC,
    TResult Function(_waitingForRedemption value)? waitingForRedemption,
    TResult Function(DepositWaitingForClaim value)? waitingForClaim,
    required TResult orElse(),
  }) {
    if (waitingForClaim != null) {
      return waitingForClaim(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DepositWaitingForClaimImplToJson(
      this,
    );
  }
}

abstract class DepositWaitingForClaim implements DepositStatus {
  const factory DepositWaitingForClaim() = _$DepositWaitingForClaimImpl;

  factory DepositWaitingForClaim.fromJson(Map<String, dynamic> json) =
      _$DepositWaitingForClaimImpl.fromJson;
}
