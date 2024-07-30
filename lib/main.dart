import 'package:apparatus_wallet/constants/themes.dart';
import 'package:apparatus_wallet/router.dart';
import 'package:apparatus_wallet/utils/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'constants/strings.dart';

void main() {
  runApp(
    /// required for Riverpod state management
    const ProviderScope(
      child: Bridge(),
    ),
  );
}

class Bridge extends ConsumerWidget {
  const Bridge({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      scaffoldMessengerKey: GlobalSnackBar.scaffoldMessengerKey,
      title: Strings.appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
