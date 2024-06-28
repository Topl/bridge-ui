import 'package:apparatus_wallet/features/bridge/models/deposit_session.dart';
import 'package:apparatus_wallet/features/bridge/services/bridge_api_service.dart';
import 'package:brambldart/brambldart.dart';
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
    // return const AsyncLoading();
  }

  void updateStage(Stage stage) {
    if (state.value is AsyncLoading || state.value is AsyncError) return;

    if (state is AsyncData) {
      state = AsyncData(state.value!.copyWith(stage: stage));
    }
  }

  startDeposit(String pkey) async {
    updateStage(Stage.deposit);

    final uuid = const Uuid().v4();
    final hashed = sha256.hash(uuid.toUtf8Uint8List()).toString();
    final request = StartDepositSessionRequest(
      pkey: pkey,
      sha256: hashed,
    );

    final task = ref.read(bridgeApiServiceProvider).startSession(request);
    await task.run().then((value) {
      value.match(() {
        state = const AsyncError("Error During Network Request", StackTrace.empty);
      }, (t) {
        state = const AsyncData(DepositState(stage: Stage.sendToEscrow));
      });
    }, onError: (error) {
      print(error);
      state = AsyncError(error, StackTrace.empty);
    });
  }

  getMintingStatus(String sessionID) async {
    final task = ref.read(bridgeApiServiceProvider).getMintingStatus(sessionID);
    await task.run().then((value) {
      value.match(() {
        state = const AsyncError("Error During Network Request", StackTrace.empty);
      }, (t) {
        state = const AsyncData(DepositState(stage: Stage.minting));
      });
    }, onError: (error) {
      print(error);
      state = AsyncError(error, StackTrace.empty);
    });
  }

  redeem() {
    updateStage(Stage.redeem);
  }
}

@freezed
class DepositState with _$DepositState {
  const factory DepositState({
    required Stage stage,
  }) = _DepositState;

  factory DepositState.base() => const DepositState(stage: Stage.deposit);
}

enum Stage {
  deposit,
  sendToEscrow,
  minting,
  readyToRedeem,
  walletCheck,
  redeem,
}
