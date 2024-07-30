import 'package:apparatus_wallet/features/bridge/models/deposit_session.dart';
import 'package:apparatus_wallet/features/bridge/services/bridge_api_service.dart';
import 'package:apparatus_wallet/features/peg_in/logic/bridge_api_interface.dart';
import 'package:apparatus_wallet/features/peg_in/providers/bridge_api.dart';
import 'package:apparatus_wallet/features/settings/providers/settings_state.dart';
import 'package:apparatus_wallet/utils/mock/mock_bridge_api_interface.dart';
import 'package:apparatus_wallet/utils/mock/mock_bridge_api_service.dart';
import 'package:apparatus_wallet/utils/snackbar.dart';
import 'package:brambldart/brambldart.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

part 'deposit_state.freezed.dart';
part 'deposit_state.g.dart';

@riverpod
class Deposit extends _$Deposit {
  @override
  AsyncValue<DepositState> build() {
    return AsyncData(DepositState.base());
    // return AsyncData(DepositState.deposit());
    // return const AsyncLoading();
  }

  BridgeApiServiceDefinition get serviceApi {
    /// mocking logic for when demo mode is on
    if (ref.read(settingsProvider).demoMode) {
      return ref.read(mockBridgeApiServiceProvider);
    }

    return ref.read(bridgeApiServiceProvider);
  }

  BridgeApiDefinition get api {
    /// mocking logic for when demo mode is on
    if (ref.read(settingsProvider).demoMode) {
      return ref.read(mockBridgeApiProvider);
    }

    return ref.read(bridgeApiProvider);
  }

  void updateStageSafe(Stage stage) {
    if (state.value is AsyncLoading || state.value is AsyncError) return;

    if (state is AsyncData) {
      state = AsyncData(state.value!.copyWith(stage: stage));
    }
  }

  void updateStage(Stage stage) {
    print("Updating stage to $stage");
    state = AsyncData(state.value!.copyWith(stage: stage));
  }

  void setLoading() {
    state = const AsyncLoading();
  }

  startDeposit(String pkey) async {
    final uuid = const Uuid().v4();
    final hashed = sha256.hash(uuid.toUtf8Uint8List()).toString();
    final request = StartDepositSessionRequest(
      pkey: pkey,
      sha256: hashed,
    );

    final task = serviceApi.startSession(request);
    await task.run().then((value) {
      value.match(() {
        state = const AsyncError("Error During Network Request", StackTrace.empty);
      }, (response) {
        state = AsyncData(DepositState(
          stage: Stage.deposit,
          sessionID: response.sessionID,
          escrowAddress: response.escrowAddress,
        ));
      });
    }, onError: (error) {
      print(error);
      state = AsyncError(error, StackTrace.empty);
    });
  }

  getMintingStatus(String sessionID) async {
    final service = serviceApi;

    final task = service.getMintingStatus(sessionID);
    await task.run().then((value) {
      value.match(() {
        state = const AsyncError("Error During Network Request", StackTrace.empty);
      }, (t) {
        updateStage(Stage.minted);
      });
    }, onError: (error) {
      print(error);
      state = AsyncError(error, StackTrace.empty);
    });
  }

  // redeem() {
  //   updateStage(Stage.redeem);
  // }

  btcDeposited(BuildContext context) {
    updateStage(Stage.waiting);

    final sub = Stream.periodic(const Duration(seconds: 5))
        .asyncMap((_) => api.getMintingStatus(state.value!.sessionID!))
        .where((status) =>
            // TODO: If null, raise error?
            status != null && status is MintingStatus_PeginSessionWaitingForRedemption)
        // Using where + take(1) instead of firstWhere to avoid losing the cancellation benefits of the stream
        .take(1)
        .listen((_) {
      GlobalSnackBar.show(context, 'Your funds are ready and available!');
      updateStage(Stage.minted);
    });
    sub.onError((e) => state = AsyncError("An error occurred. $e", StackTrace.empty));
    ref.onDispose(sub.cancel);
  }
}

@freezed
class DepositState with _$DepositState {
  const factory DepositState({
    required Stage stage,
    required String? sessionID,
    required String? escrowAddress,
  }) = _DepositState;

  factory DepositState.base() => const DepositState(
        stage: Stage.start,
        sessionID: null,
        escrowAddress: null,
      );

  factory DepositState.deposit() => const DepositState(
        stage: Stage.minted,
        sessionID: "1372",
        escrowAddress: "bc1qar0srrr7xfkvy5l643lydnw9re59gtzzwf5mdq",
      );
}

enum Stage {
  start,
  deposit,
  waiting,
  minted,
  redeem, //
  walletCheck, //
  done, //
}
