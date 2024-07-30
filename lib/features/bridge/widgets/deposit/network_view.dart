import 'package:flutter/material.dart';
import 'package:apparatus_wallet/features/bridge/widgets/deposit/currency_segments.dart';
import 'package:apparatus_wallet/features/bridge/widgets/deposit/currency_selector.dart';

class NetworkView extends StatefulWidget {
  const NetworkView({super.key});

  @override
  State<NetworkView> createState() => _NetworkViewState();
}

class _NetworkViewState extends State<NetworkView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ethSegment,
          const CurrencySelector(),
          // SizedBox.fromSize(size: const Size(32, 0)),
          const Icon(Icons.arrow_right_alt, color: Colors.white),
          // SizedBox.fromSize(size: const Size(32, 0)),
          apparatusSegment,
        ],
      ),
    );
  }
}
