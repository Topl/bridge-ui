import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:apparatus_wallet/features/bridge/bridge_ui.dart';
import 'package:apparatus_wallet/features/peg_in/logic/bridge_api.dart';
import 'package:apparatus_wallet/features/peg_in/widgets/peg_in.dart';

/// const routes # TODO move to own file once we get more routes
const homeRoute = '/';
const swapRoute = '/swap';

final providedNavigator = GlobalKey<NavigatorState>(); //TODO: remove with provider refactor

// GoRouter configuration
final router = GoRouter(
  initialLocation: homeRoute,
  debugLogDiagnostics: !kReleaseMode ? true : false, // Turns logging off when in release mode
  routes: [
    GoRoute(
      path: homeRoute,
      builder: (context, state) => Provider(
          create: (context) => BridgeApi(baseAddress: ""),
          child: Navigator(
              key: providedNavigator,
              onGenerateRoute: (settings) =>
                  MaterialPageRoute(builder: (context) => const PegInPage(), settings: settings))),
    ),
    GoRoute(
      path: swapRoute,
      builder: (context, state) => const BridgeUi(),
    ),
  ],
);
