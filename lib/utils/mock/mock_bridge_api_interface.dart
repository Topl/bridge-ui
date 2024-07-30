import 'package:apparatus_wallet/features/peg_in/logic/bridge_api_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mock_bridge_api_interface.g.dart';

@riverpod
class MockBridgeApi extends _$MockBridgeApi {
  MockBridgeApiInterface build() =>
      // TODO: Don't hardcode
      MockBridgeApiInterface(baseAddress: "http://localhost:5000");
}

class MockBridgeApiInterface extends BridgeApiDefinition {
  MockBridgeApiInterface({required baseAddress}) : super(baseAddress: '');

  @override
  Future<StartSessionResponse> startSession(StartSessionRequest request) async {
    return StartSessionResponse(
        sessionID: "1234",
        script: "script",
        escrowAddress: "bc2qar0sxxr7xfkvy5l64alydnw9re59g5zzwf5mdq",
        descriptor: "descriptor");
  }

  @override
  Future<MintingStatus?> getMintingStatus(String sessionID) async {
    final counter = CounterSingleton().count;
    print(counter);

    CounterSingleton().increment();
    if (counter >= 1 && counter < 3) {
      return MintingStatus_PeginSessionStateWaitingForBTC();
    } else if (counter >= 3 && counter < 7) {
      return MintingStatus_PeginSessionWaitingForClaim();
    } else if (counter >= 7) {
      CounterSingleton().reset();
      return MintingStatus_PeginSessionWaitingForRedemption(
          address: "Topl Address", bridgePKey: "BridgePKey", redeemScript: "redeemscript");
    } else {
      return null;
    }
  }
}

/// simple way to keep mock state
class CounterSingleton {
  static final CounterSingleton _instance = CounterSingleton._internal();
  int _count = 0;

  factory CounterSingleton() {
    return _instance;
  }

  CounterSingleton._internal();

  void increment() {
    _count++;
  }

  void reset() {
    _count = 0;
  }

  int get count => _count;
}
