import 'dart:convert';

import 'package:apparatus_wallet/features/peg_in/logic/http_client.dart';

abstract class BridgeApiDefinition {
  final String baseAddress;

  BridgeApiDefinition({required this.baseAddress});

  Future<StartSessionResponse> startSession(StartSessionRequest request);

  Future<MintingStatus?> getMintingStatus(String sessionID);
}

class BridgeApiInterface extends BridgeApiDefinition {

  BridgeApiInterface({required baseAddress}) : super(baseAddress: '');

  @override
  Future<StartSessionResponse> startSession(StartSessionRequest request) async {
    final response = await httpClient.post(Uri.parse("$baseAddress/api/start-session-pegin"),
        body: utf8.encode(json.encode(request.toJson())),
        headers: {'Content-Type': 'application/json'}..addAll(corsHeaders));
    assert(response.statusCode == 200, "HTTP Error: ${response.body}");
    final decoded = json.decode(utf8.decode(response.bodyBytes));
    return StartSessionResponse.fromJson(decoded);
  }

  @override
  Future<MintingStatus?> getMintingStatus(String sessionID) async {
    final response = await httpClient.post(Uri.parse("$baseAddress/api/start-session-pegin"),
        body: utf8.encode(json.encode({"sessionID": sessionID})),
        headers: {'Content-Type': 'application/json'}..addAll(corsHeaders));
    if (response.statusCode == 404) return null;
    assert(response.statusCode == 200, "HTTP Error: ${response.body}");
    final decoded = json.decode(utf8.decode(response.bodyBytes));
    return MintingStatus.fromJson(decoded);
  }
}

class StartSessionRequest {
  final String pkey;
  final String sha256;

  StartSessionRequest({required this.pkey, required this.sha256});

  dynamic toJson() => {
        "pkey": pkey,
        "sha256": sha256,
      };
}

class StartSessionResponse {
  final String sessionID;
  final String script;
  final String escrowAddress;
  final String descriptor;

  StartSessionResponse(
      {required this.sessionID, required this.script, required this.escrowAddress, required this.descriptor});

  dynamic toJson() => {
        "sessionID": sessionID,
        "script": script,
        "escrowAddress": escrowAddress,
        "descriptor": descriptor,
      };

  static StartSessionResponse fromJson(data) => StartSessionResponse(
        sessionID: data["sessionID"],
        script: data["script"],
        escrowAddress: data["escrowAddress"],
        descriptor: data["descriptor"],
      );
}

abstract class MintingStatus {
  static MintingStatus fromJson(data) {
    ArgumentError.checkNotNull(data["mintingStatus"]);
    switch (data["mintingStatus"]) {
      case "PeginSessionStateWaitingForBTC":
        return MintingStatus_PeginSessionStateWaitingForBTC();
      case "PeginSessionWaitingForRedemption":
        return MintingStatus_PeginSessionWaitingForRedemption.fromJson(data);
      case "PeginSessionWaitingForClaim":
        return MintingStatus_PeginSessionWaitingForClaim();
      default:
        throw ArgumentError.value(data["mintingStatus"]);
    }
  }
}

class MintingStatus_PeginSessionStateWaitingForBTC extends MintingStatus {}

class MintingStatus_PeginSessionWaitingForRedemption extends MintingStatus {
  final String address;
  final String bridgePKey;
  final String redeemScript;

  MintingStatus_PeginSessionWaitingForRedemption(
      {required this.address, required this.bridgePKey, required this.redeemScript});

  static MintingStatus_PeginSessionWaitingForRedemption fromJson(data) =>
      MintingStatus_PeginSessionWaitingForRedemption(
        address: data.address,
        bridgePKey: data.bridgePKey,
        redeemScript: data.redeemScript,
      );
}

class MintingStatus_PeginSessionWaitingForClaim extends MintingStatus {}
