import 'package:apparatus_wallet/constants/assets.dart';
import 'package:apparatus_wallet/constants/links.dart';
import 'package:apparatus_wallet/constants/routes.dart';
import 'package:apparatus_wallet/constants/strings.dart';
import 'package:apparatus_wallet/features/base/providers/navigation_service.dart';
import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:apparatus_wallet/utils/utils.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sidebarx/sidebarx.dart';

class SideBar extends HookConsumerWidget {
  const SideBar({super.key});

  static const textStyle = TextStyle(color: Colors.white, fontSize: textM, fontWeight: FontWeight.w500);
  static const textStyleHeader = TextStyle(color: Colors.white, fontSize: textL, fontWeight: FontWeight.w500);

  static const double expandedWidth = 192;
  static const double collapsedWidth = 64;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nav = ref.read(navigationServiceProvider.notifier);

    // not in love with this, this is so that the controller is aware of the current navroute
    // when a child gets pushed from outside of this class
    const navMap = {
      dashboardRoute: (dashboardRoute, 0),
      bridgeRoute: (bridgeRoute, 1),
      transferRoute: (transferRoute, 2),
      walletRoute: (walletRoute, 3),
      settingsRoute: (settingsRoute, 4),
    };

    final controller = useState(SidebarXController(selectedIndex: navMap[nav.route]?.$2 ?? 0, extended: true));

    return SidebarX(
      footerDivider: const Divider(),
      animationDuration: const Duration(milliseconds: 100),
      extendedTheme: SidebarXTheme(
        textStyle: textStyle,
        itemTextPadding: const EdgeInsets.symmetric(horizontal: 16),
        itemMargin: const EdgeInsets.only(left: 16),
        selectedItemMargin: const EdgeInsets.only(left: 16),
        selectedItemTextPadding: const EdgeInsets.symmetric(horizontal: 16),
        selectedTextStyle: textStyle.copyWith(color: context.colors.primary),
        hoverTextStyle: textStyle.copyWith(color: context.colors.primary),
        width: expandedWidth,
      ),
      theme: const SidebarXTheme(
        width: collapsedWidth,
      ),
      toggleButtonBuilder: (context, extended) {
        return IconButton(
          icon: Icon(extended ? Icons.arrow_back_ios : Icons.arrow_forward_ios),
          onPressed: () {
            controller.value.toggleExtended();
          },
        );
      },
      headerBuilder: (context, extended) {
        return Container(
            margin: const EdgeInsets.only(bottom: 48, top: 16),
            child: Column(
              children: [
                SizedBox(
                  width: 64,
                  height: 64,
                  child: Assets.apparatusDark,
                ),
                controller.value.extended ? const Text(Strings.apparatus, style: textStyleHeader) : const SizedBox(),
              ],
            ));
      },
      footerBuilder: (context, extended) {
        return Container(
            height: 32,
            width: expandedWidth,
            margin: const EdgeInsets.only(top: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () => launchURL(Links.termsOfUsage),
                    child: controller.value.extended
                        ? const Row(
                            mainAxisSize: MainAxisSize.min,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: Text(
                                Strings.termsOfUse,
                                style: textStyle,
                                overflow: TextOverflow.ellipsis,
                              )),
                              horizontalSpacerS,
                              Icon(Icons.open_in_new, color: Colors.white),
                            ],
                          )
                        : const Text(Strings.termsOfUseShort, style: textStyle)),
                // controller.value.extended ? const Text("Demo", style: textStyleHeader) : const SizedBox(),
              ],
            ));
      },
      controller: controller.value,
      items: [
        SidebarXItem(
          icon: Icons.dashboard,
          label: Strings.navOverview,
          onTap: () {
            context.go(navMap[dashboardRoute]!.$1);
          },
        ),
        SidebarXItem(
          icon: Icons.move_up,
          label: Strings.navBridge,
          onTap: () {
            context.go(navMap[bridgeRoute]!.$1);
          },
        ),
        SidebarXItem(
          icon: Icons.swap_horiz,
          label: Strings.navTransfer,
          onTap: () {
            context.go(navMap[transferRoute]!.$1);
          },
        ),
        SidebarXItem(
          icon: Icons.account_balance_wallet,
          label: Strings.navWallet,
          onTap: () {
            context.go(navMap[walletRoute]!.$1);
          },
        ),
        SidebarXItem(
          icon: Icons.settings,
          label: Strings.navSettings,
          onTap: () {
            context.go(navMap[settingsRoute]!.$1);
          },
        ),
      ],
    );
  }
}
