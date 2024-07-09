import 'package:apparatus_wallet/utils/rpc/channel_factory_web.dart';
import 'package:grpc/grpc_connection_interface.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rpc_channel.g.dart';

@riverpod
class RpcChannel extends _$RpcChannel {
  @override
  RpcChannelState build() {
    final channel = makeChannel("localhost", 9094, false);
    return RpcChannelState(nodeRpcChannel: channel, genusRpcChannel: channel);
  }
}

class RpcChannelState {
  final ClientChannelBase nodeRpcChannel;
  final ClientChannelBase genusRpcChannel;

  RpcChannelState(
      {required this.nodeRpcChannel, required this.genusRpcChannel});
}
