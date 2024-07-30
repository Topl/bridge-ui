import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@riverpod
class Settings extends _$Settings {
  @override
  SettingsState build() {
    return SettingsState.base();
  }

  // TODO: add persistence layer

  setDemoMode(bool demoMode) {
    state = state.copyWith(demoMode: demoMode);
  }

  setTheme(UiTheme theme) {
    state = state.copyWith(theme: theme);
  }

  setInactivityTimeout(double inactivityTimeout) {
    state = state.copyWith(inactivityTimeout: inactivityTimeout);
  }

  setLanguage(Language language) {
    state = state.copyWith(language: language);
  }

  setNickName(String nickName) {
    state = state.copyWith(nickName: nickName);
  }

  setPreferredFiatCurrency(FiatCurrency preferredFiatCurrency) {
    state = state.copyWith(preferredFiatCurrency: preferredFiatCurrency);
  }
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required bool demoMode,
    required UiTheme theme,
    required double inactivityTimeout, // in minutes
    required Language language,
    required String nickName,
    required FiatCurrency preferredFiatCurrency,
  }) = _SettingsState;

  factory SettingsState.base() {
    return const SettingsState(
      demoMode: false,
      theme: UiTheme.system,
      inactivityTimeout: 30,
      language: Language.en,
      nickName: 'Topl',
      preferredFiatCurrency: FiatCurrency.usd,
    );
  }
}

enum FiatCurrency { usd, eur, gbp, chf, aud, cad, jpy, cny }

enum Language { en, fr, de, es, it, pt, ru, zh }

extension FiatCurrencyExtension on FiatCurrency {
  String toShortString() {
    switch (this) {
      case FiatCurrency.usd:
        return 'USD';
      case FiatCurrency.eur:
        return 'EUR';
      case FiatCurrency.gbp:
        return 'GBP';
      case FiatCurrency.chf:
        return 'CHF';
      case FiatCurrency.aud:
        return 'AUD';
      case FiatCurrency.cad:
        return 'CAD';
      case FiatCurrency.jpy:
        return 'JPY';
      case FiatCurrency.cny:
        return 'CNY';
      default:
        return '';
    }
  }

  static FiatCurrency fromShortString(String shortString) {
    switch (shortString) {
      case 'USD':
        return FiatCurrency.usd;
      case 'EUR':
        return FiatCurrency.eur;
      case 'GBP':
        return FiatCurrency.gbp;
      case 'CHF':
        return FiatCurrency.chf;
      case 'AUD':
        return FiatCurrency.aud;
      case 'CAD':
        return FiatCurrency.cad;
      case 'JPY':
        return FiatCurrency.jpy;
      case 'CNY':
        return FiatCurrency.cny;
      default:
        throw ArgumentError('Invalid currency string: $shortString');
    }
  }
}

extension LanguageExtension on Language {
  String toShortString() {
    switch (this) {
      case Language.en:
        return 'English';
      case Language.fr:
        return 'French';
      case Language.de:
        return 'German';
      case Language.es:
        return 'Spanish';
      case Language.it:
        return 'Italian';
      case Language.pt:
        return 'Portuguese';
      case Language.ru:
        return 'Russian';
      case Language.zh:
        return 'Chinese';
      default:
        return '';
    }
  }

  static Language fromShortString(String shortString) {
    switch (shortString) {
      case 'English':
        return Language.en;
      case 'French':
        return Language.fr;
      case 'German':
        return Language.de;
      case 'Spanish':
        return Language.es;
      case 'Italian':
        return Language.it;
      case 'Portuguese':
        return Language.pt;
      case 'Russian':
        return Language.ru;
      case 'Chinese':
        return Language.zh;
      default:
        throw ArgumentError('Invalid language string: $shortString');
    }
  }
}

enum UiTheme { light, dark, system }

extension UiThemeExtension on UiTheme {
  String toShortString() {
    switch (this) {
      case UiTheme.light:
        return 'Light';
      case UiTheme.dark:
        return 'Dark';
      case UiTheme.system:
        return 'System';
      default:
        return '';
    }
  }

  static UiTheme fromShortString(String shortString) {
    switch (shortString) {
      case 'Light':
        return UiTheme.light;
      case 'Dark':
        return UiTheme.dark;
      case 'System':
        return UiTheme.system;
      default:
        throw ArgumentError('Invalid theme string: $shortString');
    }
  }
}
