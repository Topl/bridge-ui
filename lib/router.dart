import 'package:apparatus_wallet/features/bridge/widgets/utxos_view.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:apparatus_wallet/features/bridge/bridge_ui.dart';
import 'package:apparatus_wallet/constants/assets.dart';
import 'package:apparatus_wallet/constants/routes.dart';
import 'package:apparatus_wallet/features/bridge/bridge_ui.dart';
import 'package:apparatus_wallet/features/dashboard/dashboard.dart';
import 'package:apparatus_wallet/features/peg_in/logic/bridge_api.dart';
import 'package:apparatus_wallet/features/peg_in/widgets/peg_in.dart';
import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart' as legacy;
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// const routes # TODO move to own file once we get more routes
const homeRoute = '/';
const swapRoute = '/swap';
const walletRoute = '/wallet';

// GoRouter configuration
final router = GoRouter(
  initialLocation: homeRoute,
  debugLogDiagnostics:
      !kReleaseMode ? true : false, // Turns logging off when in release mode
  routes: [
    GoRoute(
      path: homeRoute,
      builder: (context, state) => const PegInPage(),
    ),
    GoRoute(
      path: swapRoute,
      builder: (context, state) => const BridgeUi(),
    ),
    GoRoute(
      path: walletRoute,
      builder: (context, state) => const UtxosView(),
    ),
  ],
);
import 'features/base/base.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter router(Ref ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: dashboardRoute,
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
      GoRoute(
        path: homeRoute,
        builder: (context, state) => Scaffold(
          backgroundColor: bkg,
          body: SelectionArea(
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      context.go(dashboardRoute);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: Assets.apparatusDark,
                        ),
                        Text("Welcome to Apparatus Wallet", style: context.textStyles.displayLarge),
                        verticalSpacerL,
                        Text("Click anywhere on the screen to go to bridge", style: context.textStyles.displaySmall),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}

// GoRouter configuration
