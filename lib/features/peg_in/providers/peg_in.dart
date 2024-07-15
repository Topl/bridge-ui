import 'dart:convert';

import 'package:apparatus_wallet/features/peg_in/logic/bridge_api.dart';
import 'package:apparatus_wallet/features/peg_in/providers/bridge_api.dart';
import 'package:brambldart/brambldart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:convert/convert.dart' show hex;

part 'peg_in.freezed.dart';
part 'peg_in.g.dart';

@riverpod
class PegIn extends _$PegIn {
  @override
  PegInState build() => PegInState.base();

  startSession() async {
    state = state.copyWith(sessionStarted: true);
    final uuid = const Uuid().v4();
    final hashed = hex.encode(sha256.hash(utf8.encode(uuid)));
    final request = StartSessionRequest(
        pkey:
            // TODO: This comes from the bridge demo - should it be replaced?
            "0295bb5a3b80eeccb1e38ab2cbac2545e9af6c7012cdc8d53bd276754c54fc2e4a",
        sha256: hashed);
    try {
      final response = await ref.watch(bridgeApiProvider).startSession(request);
      state = state.copyWith(
        sessionID: response.sessionID,
        escrowAddress: response.escrowAddress,
      );
    } catch (e) {
      state = state.copyWith(error: "An error occurred. Lol! $e");
    }
  }

  btcDeposited() {
    state = state.copyWith(btcDeposited: true);
    final bridgeApi = ref.watch(bridgeApiProvider);
    final sub = Stream.periodic(const Duration(seconds: 5))
        .asyncMap((_) => bridgeApi.getMintingStatus(state.sessionID!))
        .where((status) =>
            // TODO: If null, raise error?
            status != null &&
            status is MintingStatus_PeginSessionWaitingForRedemption)
        // Using where + take(1) instead of firstWhere to avoid losing the cancelation benefits of the stream
        .take(1)
        .listen((_) {
      state = state.copyWith(tBtcMinted: true);
    });
    sub.onError(
        (e) => state = state.copyWith(error: "An error occurred. Lol! $e"));
    ref.onDispose(sub.cancel);
  }

  tBtcAccepted() {
    state = PegInState.base();
  }
}

@freezed
class PegInState with _$PegInState {
  const factory PegInState({
    required bool sessionStarted,
    required String? sessionID,
    required String? escrowAddress,
    required bool btcDeposited,
    required bool tBtcMinted,
    required String? error,
  }) = _PegInState;

  factory PegInState.base() => const PegInState(
        sessionStarted: false,
        sessionID: null,
        escrowAddress: null,
        btcDeposited: false,
        tBtcMinted: false,
        error: null,
      );
}
