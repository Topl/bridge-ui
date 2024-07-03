import 'package:brambldart/brambldart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rpc_channel.g.dart';

@riverpod
class RpcChannel extends _$RpcChannel {
  @override
  RpcChannelState build() {
    // TODO
    return RpcChannelState(nodeRpcChannel: null!, genusRpcChannel: null!);
  }
}

class RpcChannelState {
  final Channel nodeRpcChannel;
  final Channel genusRpcChannel;

  RpcChannelState(
      {required this.nodeRpcChannel, required this.genusRpcChannel});
}
