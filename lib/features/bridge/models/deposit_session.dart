import 'package:freezed_annotation/freezed_annotation.dart';

part 'deposit_session.freezed.dart';
part 'deposit_session.g.dart';

@freezed
class StartDepositSessionRequest with _$StartDepositSessionRequest {
  const factory StartDepositSessionRequest({
    required String pkey,
    required String sha256,
  }) = _StartDepositSessionRequest;

  factory StartDepositSessionRequest.fromJson(Map<String, dynamic> json) => _$StartDepositSessionRequestFromJson(json);
}

@freezed
class StartDepositSessionResponse with _$StartDepositSessionResponse {
  const factory StartDepositSessionResponse({
    required String sessionID,
    required String script,
    required String escrowAddress,
    required String descriptor,
  }) = _StartDepositSessionResponse;

  factory StartDepositSessionResponse.fromJson(Map<String, dynamic> json) =>
      _$StartDepositSessionResponseFromJson(json);
}
