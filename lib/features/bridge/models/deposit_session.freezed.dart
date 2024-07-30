// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deposit_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StartDepositSessionRequest _$StartDepositSessionRequestFromJson(
    Map<String, dynamic> json) {
  return _StartDepositSessionRequest.fromJson(json);
}

/// @nodoc
mixin _$StartDepositSessionRequest {
  String get pkey => throw _privateConstructorUsedError;
  String get sha256 => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartDepositSessionRequestCopyWith<StartDepositSessionRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartDepositSessionRequestCopyWith<$Res> {
  factory $StartDepositSessionRequestCopyWith(StartDepositSessionRequest value,
          $Res Function(StartDepositSessionRequest) then) =
      _$StartDepositSessionRequestCopyWithImpl<$Res,
          StartDepositSessionRequest>;
  @useResult
  $Res call({String pkey, String sha256});
}

/// @nodoc
class _$StartDepositSessionRequestCopyWithImpl<$Res,
        $Val extends StartDepositSessionRequest>
    implements $StartDepositSessionRequestCopyWith<$Res> {
  _$StartDepositSessionRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pkey = null,
    Object? sha256 = null,
  }) {
    return _then(_value.copyWith(
      pkey: null == pkey
          ? _value.pkey
          : pkey // ignore: cast_nullable_to_non_nullable
              as String,
      sha256: null == sha256
          ? _value.sha256
          : sha256 // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartDepositSessionRequestImplCopyWith<$Res>
    implements $StartDepositSessionRequestCopyWith<$Res> {
  factory _$$StartDepositSessionRequestImplCopyWith(
          _$StartDepositSessionRequestImpl value,
          $Res Function(_$StartDepositSessionRequestImpl) then) =
      __$$StartDepositSessionRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String pkey, String sha256});
}

/// @nodoc
class __$$StartDepositSessionRequestImplCopyWithImpl<$Res>
    extends _$StartDepositSessionRequestCopyWithImpl<$Res,
        _$StartDepositSessionRequestImpl>
    implements _$$StartDepositSessionRequestImplCopyWith<$Res> {
  __$$StartDepositSessionRequestImplCopyWithImpl(
      _$StartDepositSessionRequestImpl _value,
      $Res Function(_$StartDepositSessionRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pkey = null,
    Object? sha256 = null,
  }) {
    return _then(_$StartDepositSessionRequestImpl(
      pkey: null == pkey
          ? _value.pkey
          : pkey // ignore: cast_nullable_to_non_nullable
              as String,
      sha256: null == sha256
          ? _value.sha256
          : sha256 // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartDepositSessionRequestImpl implements _StartDepositSessionRequest {
  const _$StartDepositSessionRequestImpl(
      {required this.pkey, required this.sha256});

  factory _$StartDepositSessionRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StartDepositSessionRequestImplFromJson(json);

  @override
  final String pkey;
  @override
  final String sha256;

  @override
  String toString() {
    return 'StartDepositSessionRequest(pkey: $pkey, sha256: $sha256)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartDepositSessionRequestImpl &&
            (identical(other.pkey, pkey) || other.pkey == pkey) &&
            (identical(other.sha256, sha256) || other.sha256 == sha256));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, pkey, sha256);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartDepositSessionRequestImplCopyWith<_$StartDepositSessionRequestImpl>
      get copyWith => __$$StartDepositSessionRequestImplCopyWithImpl<
          _$StartDepositSessionRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartDepositSessionRequestImplToJson(
      this,
    );
  }
}

abstract class _StartDepositSessionRequest
    implements StartDepositSessionRequest {
  const factory _StartDepositSessionRequest(
      {required final String pkey,
      required final String sha256}) = _$StartDepositSessionRequestImpl;

  factory _StartDepositSessionRequest.fromJson(Map<String, dynamic> json) =
      _$StartDepositSessionRequestImpl.fromJson;

  @override
  String get pkey;
  @override
  String get sha256;
  @override
  @JsonKey(ignore: true)
  _$$StartDepositSessionRequestImplCopyWith<_$StartDepositSessionRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

StartDepositSessionResponse _$StartDepositSessionResponseFromJson(
    Map<String, dynamic> json) {
  return _StartDepositSessionResponse.fromJson(json);
}

/// @nodoc
mixin _$StartDepositSessionResponse {
  String get sessionID => throw _privateConstructorUsedError;
  String get script => throw _privateConstructorUsedError;
  String get escrowAddress => throw _privateConstructorUsedError;
  String get descriptor => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StartDepositSessionResponseCopyWith<StartDepositSessionResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StartDepositSessionResponseCopyWith<$Res> {
  factory $StartDepositSessionResponseCopyWith(
          StartDepositSessionResponse value,
          $Res Function(StartDepositSessionResponse) then) =
      _$StartDepositSessionResponseCopyWithImpl<$Res,
          StartDepositSessionResponse>;
  @useResult
  $Res call(
      {String sessionID,
      String script,
      String escrowAddress,
      String descriptor});
}

/// @nodoc
class _$StartDepositSessionResponseCopyWithImpl<$Res,
        $Val extends StartDepositSessionResponse>
    implements $StartDepositSessionResponseCopyWith<$Res> {
  _$StartDepositSessionResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionID = null,
    Object? script = null,
    Object? escrowAddress = null,
    Object? descriptor = null,
  }) {
    return _then(_value.copyWith(
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      escrowAddress: null == escrowAddress
          ? _value.escrowAddress
          : escrowAddress // ignore: cast_nullable_to_non_nullable
              as String,
      descriptor: null == descriptor
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StartDepositSessionResponseImplCopyWith<$Res>
    implements $StartDepositSessionResponseCopyWith<$Res> {
  factory _$$StartDepositSessionResponseImplCopyWith(
          _$StartDepositSessionResponseImpl value,
          $Res Function(_$StartDepositSessionResponseImpl) then) =
      __$$StartDepositSessionResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String sessionID,
      String script,
      String escrowAddress,
      String descriptor});
}

/// @nodoc
class __$$StartDepositSessionResponseImplCopyWithImpl<$Res>
    extends _$StartDepositSessionResponseCopyWithImpl<$Res,
        _$StartDepositSessionResponseImpl>
    implements _$$StartDepositSessionResponseImplCopyWith<$Res> {
  __$$StartDepositSessionResponseImplCopyWithImpl(
      _$StartDepositSessionResponseImpl _value,
      $Res Function(_$StartDepositSessionResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sessionID = null,
    Object? script = null,
    Object? escrowAddress = null,
    Object? descriptor = null,
  }) {
    return _then(_$StartDepositSessionResponseImpl(
      sessionID: null == sessionID
          ? _value.sessionID
          : sessionID // ignore: cast_nullable_to_non_nullable
              as String,
      script: null == script
          ? _value.script
          : script // ignore: cast_nullable_to_non_nullable
              as String,
      escrowAddress: null == escrowAddress
          ? _value.escrowAddress
          : escrowAddress // ignore: cast_nullable_to_non_nullable
              as String,
      descriptor: null == descriptor
          ? _value.descriptor
          : descriptor // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StartDepositSessionResponseImpl
    implements _StartDepositSessionResponse {
  const _$StartDepositSessionResponseImpl(
      {required this.sessionID,
      required this.script,
      required this.escrowAddress,
      required this.descriptor});

  factory _$StartDepositSessionResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$StartDepositSessionResponseImplFromJson(json);

  @override
  final String sessionID;
  @override
  final String script;
  @override
  final String escrowAddress;
  @override
  final String descriptor;

  @override
  String toString() {
    return 'StartDepositSessionResponse(sessionID: $sessionID, script: $script, escrowAddress: $escrowAddress, descriptor: $descriptor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartDepositSessionResponseImpl &&
            (identical(other.sessionID, sessionID) ||
                other.sessionID == sessionID) &&
            (identical(other.script, script) || other.script == script) &&
            (identical(other.escrowAddress, escrowAddress) ||
                other.escrowAddress == escrowAddress) &&
            (identical(other.descriptor, descriptor) ||
                other.descriptor == descriptor));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, sessionID, script, escrowAddress, descriptor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StartDepositSessionResponseImplCopyWith<_$StartDepositSessionResponseImpl>
      get copyWith => __$$StartDepositSessionResponseImplCopyWithImpl<
          _$StartDepositSessionResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StartDepositSessionResponseImplToJson(
      this,
    );
  }
}

abstract class _StartDepositSessionResponse
    implements StartDepositSessionResponse {
  const factory _StartDepositSessionResponse(
      {required final String sessionID,
      required final String script,
      required final String escrowAddress,
      required final String descriptor}) = _$StartDepositSessionResponseImpl;

  factory _StartDepositSessionResponse.fromJson(Map<String, dynamic> json) =
      _$StartDepositSessionResponseImpl.fromJson;

  @override
  String get sessionID;
  @override
  String get script;
  @override
  String get escrowAddress;
  @override
  String get descriptor;
  @override
  @JsonKey(ignore: true)
  _$$StartDepositSessionResponseImplCopyWith<_$StartDepositSessionResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
