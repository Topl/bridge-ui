import 'package:apparatus_wallet/constants/routes.dart';
import 'package:apparatus_wallet/features/bridge/bridge_ui.dart';
import 'package:apparatus_wallet/features/dashboard/dashboard.dart';
import 'package:apparatus_wallet/features/peg_in/logic/bridge_api.dart';
import 'package:apparatus_wallet/features/peg_in/widgets/peg_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as legacy;
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'features/base/base.dart';

part 'router.g.dart';



final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: bridgeRoute,
    debugLogDiagnostics: !kReleaseMode ? true : false, // Turns logging off when in release mode
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return BaseUI(child);
        },
        routes: [
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: dashboardRoute,
            builder: (context, state) => const Dashboard("Dashboard"),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: transferRoute,
            builder: (context, state) => const Dashboard("Transfer"),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: bridgeRoute,
            builder: (context, state) => const BridgeUi(),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: walletRoute,
            builder: (context, state) => const Dashboard("Wallet"),
          ),
          GoRoute(
            parentNavigatorKey: _shellNavigatorKey,
            path: settingsRoute,
            builder: (context, state) => const Dashboard("Settings"),
          ),
        ],
      ),
      GoRoute(
        path: pegInRoute,
        builder: (context, state) => legacy.Provider(
            create: (context) => BridgeApi(baseAddress: ""),
            child: Navigator(
                key: _rootNavigatorKey,
                onGenerateRoute: (settings) =>
                    MaterialPageRoute(builder: (context) => const PegInPage(), settings: settings))),
      ),
      GoRoute(
        path: mainRoute,
        builder: (context, state) => BaseUI(Container()),
      ),
    ],
  );
}

// GoRouter configuration

