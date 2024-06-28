import 'dart:convert';

import 'package:apparatus_wallet/features/bridge/models/deposit_session.dart';
import 'package:apparatus_wallet/features/bridge/models/deposit_status.dart';
import 'package:apparatus_wallet/features/peg_in/logic/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'bridge_api_service.g.dart';

@riverpod
BridgeApiService bridgeApiService(Ref ref) {
  return BridgeApiService("");
}

abstract class BridgeApiServiceDefinition {
  TaskOption<StartDepositSessionResponse> startSession(StartDepositSessionRequest request);

  TaskOption<DepositStatus?> getMintingStatus(String sessionID);
}

class BridgeApiService implements BridgeApiServiceDefinition {
  final String baseAddress;
  final headers = {'Content-Type': 'application/json'}..addAll(corsHeaders);

  BridgeApiService(this.baseAddress);

  @override
  TaskOption<DepositStatus?> getMintingStatus(String sessionID) => TaskOption.tryCatch(
        () async {
          final response = await httpClient.post(Uri.parse("$baseAddress/api/start-session-pegin"),
              body: utf8.encode(json.encode({"sessionID": sessionID})), headers: headers);
          if (response.statusCode == 404) return null;
          assert(response.statusCode == 200, "HTTP Error: ${response.body}");
          final decoded = json.decode(utf8.decode(response.bodyBytes));
          return DepositStatus.fromJson(decoded);
        },
      );

  @override
  TaskOption<StartDepositSessionResponse> startSession(StartDepositSessionRequest request) => TaskOption.tryCatch(
        () async {
          final response = await httpClient.post(Uri.parse("$baseAddress/api/start-session-pegin"),
              body: utf8.encode(json.encode(request.toJson())), headers: headers);
          assert(response.statusCode == 200, "HTTP Error: ${response.body}");
          final decoded = json.decode(utf8.decode(response.bodyBytes));
          return StartDepositSessionResponse.fromJson(decoded);
        },
      );
}
