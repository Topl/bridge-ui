import 'package:apparatus_wallet/features/settings/providers/settings_state.dart';
import 'package:apparatus_wallet/features/settings/widgets/checkbox_setting_widget.dart';
import 'package:apparatus_wallet/features/settings/widgets/drop_down_setting_widget.dart';
import 'package:apparatus_wallet/features/settings/widgets/slider_setting_widget.dart';
import 'package:apparatus_wallet/features/settings/widgets/text_field_setting_widget.dart';
import 'package:apparatus_wallet/utils/ui_utils.dart';
import 'package:apparatus_wallet/utils/utils.dart';
import 'package:awesome_flutter_extensions/awesome_flutter_extensions.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SettingsUi extends HookConsumerWidget {
  const SettingsUi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SettingsContent();
  }
}

const textStyle = TextStyle(color: Colors.white, fontSize: textM, fontWeight: FontWeight.w500);
const textStyleHeader = TextStyle(color: Colors.white, fontSize: textL, fontWeight: FontWeight.w500);
const textStylePage = TextStyle(color: Colors.white, fontSize: textXL, fontWeight: FontWeight.w500);

class SettingsContent extends ConsumerWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(settingsProvider);
    final notifier = ref.watch(settingsProvider.notifier);

    return SelectionArea(
      child: Container(
        constraints: const BoxConstraints(minWidth: 200, maxWidth: 800, minHeight: 400, maxHeight: 1200),
        margin: const EdgeInsets.all(32),
        padding: const EdgeInsets.all(32),
        decoration: BoxDecoration(
          color: context.colors.scaffoldBackground,
          borderRadius: BorderRadius.circular(32),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text("Settings", style: textStylePage),
            verticalSpacerL,
            Expanded(
              child: ListView(
                children: <Widget>[
                  ExpansionTile(
                    title: const Text(
                      "General",
                      style: textStyleHeader,
                    ),
                    initiallyExpanded: true,
                    childrenPadding: const EdgeInsets.all(16),
                    children: <Widget>[
                      TextFieldSettingWidget(
                        settingsName: 'Nickname',
                        value: state.nickName,
                        hintText: 'Preferred nickname',
                        onChanged: (String newValue) => notifier.setNickName(newValue),
                      ),
                      DropDownSettingWidget(
                        settingsName: 'Language',
                        defaultSettingsValue: Language.en.toShortString(),
                        settingsCallback: (String newValue) =>
                            notifier.setLanguage(LanguageExtension.fromShortString(newValue)),
                        value: state.language.toShortString(),
                        items: Language.values.map((e) => e.toShortString()).toList(),
                      ),
                      DropDownSettingWidget(
                        settingsName: 'Theme',
                        defaultSettingsValue: UiTheme.system.toShortString(),
                        settingsCallback: (String newValue) =>
                            notifier.setTheme(UiThemeExtension.fromShortString(newValue)),
                        value: state.theme.toShortString(),
                        items: UiTheme.values.map((e) => e.toShortString()).toList(),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Text(
                      "Preferences",
                      style: textStyleHeader,
                    ),
                    initiallyExpanded: true,
                    childrenPadding: const EdgeInsets.all(16),
                    children: <Widget>[
                      DropDownSettingWidget(
                        settingsName: 'Preferred Fiat Currency',
                        defaultSettingsValue: FiatCurrency.usd.toShortString(),
                        settingsCallback: (String newValue) =>
                            notifier.setPreferredFiatCurrency(FiatCurrencyExtension.fromShortString(newValue)),
                        value: state.preferredFiatCurrency.toShortString(),
                        items: FiatCurrency.values.map((e) => e.toShortString()).toList(),
                      ),
                      ListTile(
                        title: const Text('Enable Notifications'),
                        trailing: Switch(
                          value: false,
                          onChanged: (bool value) {
                            // TODO: Handle switch state change
                          },
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                      title: const Text(
                        "Security",
                        style: textStyleHeader,
                      ),
                      initiallyExpanded: true,
                      childrenPadding: const EdgeInsets.all(16),
                      children: <Widget>[
                        SliderSettingWidget(
                          settingsName: 'Inactivity Timeout (Seconds)',
                          minValue: 5,
                          maxValue: 60,
                          currentValue: state.inactivityTimeout,
                          onChanged: (double newValue) => notifier.setInactivityTimeout(newValue),
                          divisions: 11, // Number of notches
                        ),
                        Container(
                          margin: const EdgeInsets.all(16),
                          child: RemoveWalletDataButton(
                            onRemove: () {
                              // todo: implement local data-wipe
                            },
                          ),
                        ),
                      ]),
                  Visibility(
                    visible: isDebugMode,

                    /// Only available in non-release contexts
                    child: ExpansionTile(
                      title: const Text(
                        "Debug Settings",
                        style: textStyleHeader,
                      ),
                      initiallyExpanded: true,
                      childrenPadding: const EdgeInsets.all(16),
                      children: <Widget>[
                        CheckboxSettingWidget(
                          settingsName: 'Demo Mode',
                          value: state.demoMode,
                          onChanged: (bool? newValue) => notifier.setDemoMode(newValue!),
                        ),

                        /// Add more debug settings here
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RemoveWalletDataButton extends StatelessWidget {
  final VoidCallback onRemove;

  const RemoveWalletDataButton({
    super.key,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.symmetric(horizontal: 32, vertical: 16)),
        backgroundColor: WidgetStateProperty.all(context.colors.primary),
        textStyle: WidgetStateProperty.all(const TextStyle(fontSize: textL, fontWeight: FontWeight.bold)),
        shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
      ),
      onPressed: () async {
        final bool? confirmed = await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirm'),
              content: const Text('Are you sure you want to remove all wallet data? This action cannot be undone.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text('Remove'),
                ),
              ],
            );
          },
        );

        if (confirmed == true) {
          onRemove();
        }
      },
      child: const Text('Remove Wallet Data', style: textStyleHeader),
    );
  }
}
