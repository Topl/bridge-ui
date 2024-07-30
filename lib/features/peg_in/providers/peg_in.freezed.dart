// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'peg_in.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PegInState {
  bool get sessionStarted => throw _privateConstructorUsedError;
  String? get sessionID => throw _privateConstructorUsedError;
  String? get escrowAddress => throw _privateConstructorUsedError;
  bool get btcDeposited => throw _privateConstructorUsedError;
  bool get tBtcMinted => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PegInStateCopyWith<PegInState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PegInStateCopyWith<$Res> {
  factory $PegInStateCopyWith(
          PegInState value, $Res Function(PegInState) then) =
      _$PegInStateCopyWithImpl<$Res, PegInState>;
  @useResult
  $Res call(
      {bool sessionStarted,
      String? sessionID,
      String? escrowAddress,
      bool btcDeposited,
      bool tBtcMinted,
      String? error});
}

/// @nodoc
class _$PegInStateCopyWithImpl<$Res, $Val extends PegInState>
    implements $PegInStateCopyWith<$Res> {
  _$PegInStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionStarted = null,
    Object? sessionID = freezed,
    Object? escrowAddress = freezed,
    Object? btcDeposited = null,
    Object? tBtcMinted = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      sessionStarted: null == sessionStarted
          ? _value.sessionStarted
          : sessionStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionID: freezed == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String?,
      escrowAddress: freezed == escrowAddress
          ? _value.escrowAddress
          : escrowAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      btcDeposited: null == btcDeposited
          ? _value.btcDeposited
          : btcDeposited // ignore: cast_nullable_to_non_nullable
              as bool,
      tBtcMinted: null == tBtcMinted
          ? _value.tBtcMinted
          : tBtcMinted // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PegInStateImplCopyWith<$Res>
    implements $PegInStateCopyWith<$Res> {
  factory _$$PegInStateImplCopyWith(
          _$PegInStateImpl value, $Res Function(_$PegInStateImpl) then) =
      __$$PegInStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool sessionStarted,
      String? sessionID,
      String? escrowAddress,
      bool btcDeposited,
      bool tBtcMinted,
      String? error});
}

/// @nodoc
class __$$PegInStateImplCopyWithImpl<$Res>
    extends _$PegInStateCopyWithImpl<$Res, _$PegInStateImpl>
    implements _$$PegInStateImplCopyWith<$Res> {
  __$$PegInStateImplCopyWithImpl(
      _$PegInStateImpl _value, $Res Function(_$PegInStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionStarted = null,
    Object? sessionID = freezed,
    Object? escrowAddress = freezed,
    Object? btcDeposited = null,
    Object? tBtcMinted = null,
    Object? error = freezed,
  }) {
    return _then(_$PegInStateImpl(
      sessionStarted: null == sessionStarted
          ? _value.sessionStarted
          : sessionStarted // ignore: cast_nullable_to_non_nullable
              as bool,
      sessionID: freezed == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String?,
      escrowAddress: freezed == escrowAddress
          ? _value.escrowAddress
          : escrowAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      btcDeposited: null == btcDeposited
          ? _value.btcDeposited
          : btcDeposited // ignore: cast_nullable_to_non_nullable
              as bool,
      tBtcMinted: null == tBtcMinted
          ? _value.tBtcMinted
          : tBtcMinted // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PegInStateImpl implements _PegInState {
  const _$PegInStateImpl(
      {required this.sessionStarted,
      required this.sessionID,
      required this.escrowAddress,
      required this.btcDeposited,
      required this.tBtcMinted,
      required this.error});

  @override
  final bool sessionStarted;
  @override
  final String? sessionID;
  @override
  final String? escrowAddress;
  @override
  final bool btcDeposited;
  @override
  final bool tBtcMinted;
  @override
  final String? error;

  @override
  String toString() {
    return 'PegInState(sessionStarted: $sessionStarted, sessionID: $sessionID, escrowAddress: $escrowAddress, btcDeposited: $btcDeposited, tBtcMinted: $tBtcMinted, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PegInStateImpl &&
            (identical(other.sessionStarted, sessionStarted) ||
                other.sessionStarted == sessionStarted) &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.escrowAddress, escrowAddress) ||
                other.escrowAddress == escrowAddress) &&
            (identical(other.btcDeposited, btcDeposited) ||
                other.btcDeposited == btcDeposited) &&
            (identical(other.tBtcMinted, tBtcMinted) ||
                other.tBtcMinted == tBtcMinted) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sessionStarted, sessionID,
      escrowAddress, btcDeposited, tBtcMinted, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PegInStateImplCopyWith<_$PegInStateImpl> get copyWith =>
      __$$PegInStateImplCopyWithImpl<_$PegInStateImpl>(this, _$identity);
}

abstract class _PegInState implements PegInState {
  const factory _PegInState(
      {required final bool sessionStarted,
      required final String? sessionID,
      required final String? escrowAddress,
      required final bool btcDeposited,
      required final bool tBtcMinted,
      required final String? error}) = _$PegInStateImpl;

  @override
  bool get sessionStarted;
  @override
  String? get sessionID;
  @override
  String? get escrowAddress;
  @override
  bool get btcDeposited;
  @override
  bool get tBtcMinted;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$PegInStateImplCopyWith<_$PegInStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
