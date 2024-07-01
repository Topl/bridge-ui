import 'package:apparatus_wallet/features/base/widgets/sidebar.dart';
import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BaseUI extends HookConsumerWidget {
  final Widget child;

  const BaseUI(this.child, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: bkg,
        body: SelectionArea(
          child: Row(
            children: [
              const SideBar(),
              Expanded(
                child: Center(
                  child: child
                ),
              ),
            ],
          ),
        ));
  }
}
