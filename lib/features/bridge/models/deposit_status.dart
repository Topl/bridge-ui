import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_status.freezed.dart';
part 'deposit_status.g.dart';

@freezed
class DepositStatus with _$DepositStatus {
  const factory DepositStatus.waitingForBTC() = DepositWaitingForBTC;

  const factory DepositStatus.waitingForRedemption({
    required String address,
    required String bridgePKey,
    required String redeemScript,
  }) = _waitingForRedemption;

  const factory DepositStatus.waitingForClaim() = DepositWaitingForClaim;

  factory DepositStatus.fromJson(Map<String, dynamic> json) => const DepositStatusConverter().fromJson(json);
}

// response converter using freezed
class DepositStatusConverter implements JsonConverter<DepositStatus, Map<String, dynamic>> {
  const DepositStatusConverter();

  @override
  DepositStatus fromJson(Map<String, dynamic> json) {
    ArgumentError.checkNotNull(json['mintingStatus']);
    switch (json['mintingStatus']) {
      case 'DepositWaitingForBTC':
        return const DepositStatus.waitingForBTC();
      case 'DepositWaitingForRedemption':
        return _waitingForRedemption.fromJson(json);
      case 'DepositWaitingForClaim':
        return const DepositStatus.waitingForClaim();
      default:
        throw ArgumentError.value(json['mintingStatus']);
    }
  }

  @override
  Map<String, dynamic> toJson(DepositStatus data) => data.toJson();
}

/// vanilla Implementation

// sealed class DepositStatus {
//   const DepositStatus();
//
//   factory DepositStatus.fromJson(Map<String, dynamic> json) {
//     ArgumentError.checkNotNull(json['mintingStatus']);
//     switch (json['mintingStatus']) {
//       case 'PeginSessionStateWaitingForBTC':
//         return const DepositWaitingForBTC();
//       case 'PeginSessionWaitingForRedemption':
//         return WaitingForRedemption.fromJson(json);
//       case 'PeginSessionWaitingForClaim':
//         return const DepositWaitingForClaim();
//       default:
//         throw ArgumentError.value(json['mintingStatus']);
//     }
//   }
// }
//
// class DepositWaitingForBTC extends DepositStatus {
//   const DepositWaitingForBTC();
// }
//
// class WaitingForRedemption extends DepositStatus {
//   final String address;
//   final String bridgePKey;
//   final String redeemScript;
//
//   WaitingForRedemption({
//     required this.address,
//     required this.bridgePKey,
//     required this.redeemScript,
//   });
//
//   factory WaitingForRedemption.fromJson(data) => WaitingForRedemption(
//         address: data.address,
//         bridgePKey: data.bridgePKey,
//         redeemScript: data.redeemScript,
//       );
// }
//
// class DepositWaitingForClaim extends DepositStatus {
//   const DepositWaitingForClaim();
// }
