// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deposit_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepositWaitingForBTCImpl _$$DepositWaitingForBTCImplFromJson(
        Map<String, dynamic> json) =>
    _$DepositWaitingForBTCImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DepositWaitingForBTCImplToJson(
        _$DepositWaitingForBTCImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$waitingForRedemptionImpl _$$waitingForRedemptionImplFromJson(
        Map<String, dynamic> json) =>
    _$waitingForRedemptionImpl(
      address: json['address'] as String,
      bridgePKey: json['bridgePKey'] as String,
      redeemScript: json['redeemScript'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$waitingForRedemptionImplToJson(
        _$waitingForRedemptionImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'bridgePKey': instance.bridgePKey,
      'redeemScript': instance.redeemScript,
      'runtimeType': instance.$type,
    };

_$DepositWaitingForClaimImpl _$$DepositWaitingForClaimImplFromJson(
        Map<String, dynamic> json) =>
    _$DepositWaitingForClaimImpl(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DepositWaitingForClaimImplToJson(
        _$DepositWaitingForClaimImpl instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
