import 'package:apparatus_wallet/features/bridge/models/deposit_session.dart';
import 'package:apparatus_wallet/features/bridge/models/deposit_status.dart';
import 'package:apparatus_wallet/features/bridge/services/bridge_api_service.dart';
import 'package:apparatus_wallet/features/peg_in/logic/http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mock_bridge_api_service.g.dart';

@riverpod
MockBridgeApiService mockBridgeApiService(Ref ref) {
  return MockBridgeApiService("");
}

class MockBridgeApiService implements BridgeApiServiceDefinition {
  final String baseAddress;
  final headers = {'Content-Type': 'application/json'}..addAll(corsHeaders);

  MockBridgeApiService(this.baseAddress);

  int counter = 0;

  void nextStage() {
    counter++;
  }

  @override
  TaskOption<DepositStatus?> getMintingStatus(String sessionID) => TaskOption.tryCatch(
        () async {
          if (counter == 0) {
            return const DepositStatus.waitingForBTC();
          } else if (counter == 1) {
            return const DepositStatus.waitingForRedemption(
                address: "bc1qar0srrr7xfkvy5l643lydnw9re59gtzzwf5mdq",
                bridgePKey: "0295bb5a3b80eeccb1e38ab2cbac2545e9af6c7012cdc8d53bd276754c54fc2e4a",
                redeemScript: "52210295bb5a3b80eeccb1e38ab2cbac2545e9af6c7012cdc8d53bd276754c54fc2e4a2103e4a7f");
          } else if (counter >= 2) {
            return const DepositStatus.waitingForClaim();
          } else {
            return null;
          }
        },
      );

  @override
  TaskOption<StartDepositSessionResponse> startSession(StartDepositSessionRequest request) => TaskOption.tryCatch(
        () async {
          return const StartDepositSessionResponse(
              sessionID: "1234",
              script: "script",
              escrowAddress: "bc2qar0sxxr7xfkvy5l64alydnw9re59g5zzwf5mdq",
              descriptor: "descriptor");
        },
      );
}
