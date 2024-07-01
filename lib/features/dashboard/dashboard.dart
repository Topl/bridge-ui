import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Dashboard extends HookConsumerWidget {
  final String title;

  const Dashboard(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        backgroundColor: bkg,
        // appBar: AppBar(
        //   // backgroundColor: Colors.transparent,
        //   // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   // title: Row(
        //   //   children: [
        //   //     SizedBox(
        //   //       width: 64,
        //   //       height: 64,
        //   //       child: Assets.apparatusWhite,
        //   //     ),
        //   //     const Text("Apparatus Demo", style: TextStyle(color: Colors.white)),
        //   //   ],
        //   // ),
        // ),
        body: Row(
          children: [
            // SideBar(),
            Expanded(
              child: Center(
                child: Text(title),
              ),
            ),
          ],
        ));
  }
}
