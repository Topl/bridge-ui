// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StartDepositSessionRequestImpl _$$StartDepositSessionRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$StartDepositSessionRequestImpl(
      pkey: json['pkey'] as String,
      sha256: json['sha256'] as String,
    );

Map<String, dynamic> _$$StartDepositSessionRequestImplToJson(
        _$StartDepositSessionRequestImpl instance) =>
    <String, dynamic>{
      'pkey': instance.pkey,
      'sha256': instance.sha256,
    };

_$StartDepositSessionResponseImpl _$$StartDepositSessionResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StartDepositSessionResponseImpl(
      sessionID: json['sessionID'] as String,
      script: json['script'] as String,
      escrowAddress: json['escrowAddress'] as String,
      descriptor: json['descriptor'] as String,
    );

Map<String, dynamic> _$$StartDepositSessionResponseImplToJson(
        _$StartDepositSessionResponseImpl instance) =>
    <String, dynamic>{
      'sessionID': instance.sessionID,
      'script': instance.script,
      'escrowAddress': instance.escrowAddress,
      'descriptor': instance.descriptor,
    };
