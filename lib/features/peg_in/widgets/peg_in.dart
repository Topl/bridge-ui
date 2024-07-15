import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:apparatus_wallet/features/peg_in/logic/bridge_api_interface.dart';
import 'package:uuid/uuid.dart';

/// A scaffolded page which allows a user to begin a new Peg-In session
// TODO: Update to use Riverpod
class PegInPage extends StatefulWidget {
  const PegInPage({super.key});

  @override
  State<PegInPage> createState() => _PegInPageState();
}

class _PegInPageState extends State<PegInPage> {
  bool started = false;
  String? error;
  StartSessionResponse? session;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Acquire tBTC"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            (session != null)
                ? continueButton(context, session!)
                : (error != null)
                    ? errorWidget(error!)
                    : started
                        ? const CircularProgressIndicator()
                        : startSessionButton(context),
          ],
        ),
      ),
    );
  }

  Widget startSessionButton(BuildContext context) {
    final bridgeApi = context.watch<BridgeApiInterface>();
    return TextButton.icon(
        onPressed: () => onStartSession(bridgeApi),
        icon: const Icon(Icons.start),
        label: const Text("Start Session"));
  }

  void onStartSession(BridgeApiInterface bridgeApi) async {
    setState(() => started = true);
    final uuid = const Uuid().v4();
    final hashed = sha256.convert(utf8.encode(uuid)).toString();
    final request = StartSessionRequest(
        pkey:
            "0295bb5a3b80eeccb1e38ab2cbac2545e9af6c7012cdc8d53bd276754c54fc2e4a",
        sha256: hashed);
    try {
      final response = await bridgeApi.startSession(request);
      setState(() => session = response);
    } catch (e) {
      setState(() => error = "An error occurred. Lol! $e");
    }
  }

  Widget continueButton(BuildContext context, StartSessionResponse session) =>
      TextButton.icon(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => PegInDepositFundsPage(
                      sessionID: session.sessionID,
                      escrowAddress: session.escrowAddress))),
          icon: const Icon(Icons.forward),
          label: const Text("Continue"));

  Widget errorWidget(String message) => Text(message,
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red));
}

/// A scaffolded page instructing users where to deposit BTC funds
class PegInDepositFundsPage extends StatefulWidget {
  const PegInDepositFundsPage(
      {super.key, required this.sessionID, required this.escrowAddress});

  final String sessionID;
  final String escrowAddress;

  @override
  State<StatefulWidget> createState() => _PegInDepositFundsPageState();
}

class _PegInDepositFundsPageState extends State<PegInDepositFundsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Acquire tBTC: Deposit BTC Funds"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Please send BTC to the following address.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextButton.icon(
                onPressed: () => Clipboard.setData(
                    ClipboardData(text: widget.escrowAddress)),
                icon: const Icon(Icons.copy),
                label: Text(widget.escrowAddress,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w100)),
              ),
              TextButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PegInAwaitingFundsPage(
                                sessionID: widget.sessionID)));
                  },
                  icon: const Icon(Icons.start),
                  label: const Text("Next")),
            ],
          ),
        ),
      );
}

/// A scaffolded page which waits for the API to indicate funds have been deposited
class PegInAwaitingFundsPage extends StatefulWidget {
  const PegInAwaitingFundsPage({super.key, required this.sessionID});

  final String sessionID;

  @override
  State<StatefulWidget> createState() => _PegInAwaitingFundsPageState();
}

class _PegInAwaitingFundsPageState extends State<PegInAwaitingFundsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Acquire tBTC: Awaiting BTC Transfer"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Please wait while we confirm the BTC transfer.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              FutureBuilder(
                future: awaitRedemption(context),
                builder: (context, snapshot) => snapshot.hasError
                    ? errorOccurred(snapshot.error)
                    : snapshot.hasData
                        ? successButton
                        : waiting,
              ),
            ],
          ),
        ),
      );

  Future<MintingStatus_PeginSessionWaitingForRedemption> awaitRedemption(
      BuildContext context) async {
    BridgeApiInterface client = context.watch<BridgeApiInterface>();
    MintingStatus? status = await client.getMintingStatus(widget.sessionID);
    while (status is! MintingStatus_PeginSessionWaitingForRedemption) {
      ArgumentError.checkNotNull(status);
      await Future.delayed(const Duration(seconds: 5));
      status = await client.getMintingStatus(widget.sessionID);
    }
    return status;
  }

  Widget get waiting => const CircularProgressIndicator();

  Widget get successButton => TextButton.icon(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PegInClaimFundsPage()));
      },
      icon: const Icon(Icons.wallet),
      label: const Text("Next"));
  Widget errorOccurred(Object? e) => Text('An error occurred. Lol. $e',
      style: const TextStyle(
          fontSize: 14, fontWeight: FontWeight.bold, color: Colors.red));
}

/// A scaffolded page instructing users that tBTC funds are now available in their wallet
class PegInClaimFundsPage extends StatefulWidget {
  const PegInClaimFundsPage({super.key});

  @override
  State<StatefulWidget> createState() => _PegInClaimFundsPageState();
}

class _PegInClaimFundsPageState extends State<PegInClaimFundsPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Acquire tBTC: Done"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                  'Your tBTC is ready and available for transfer in your wallet.',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              TextButton.icon(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PegInPage()),
                        (_) => true);
                  },
                  icon: const Icon(Icons.done),
                  label: const Text("Back")),
            ],
          ),
        ),
      );
}
