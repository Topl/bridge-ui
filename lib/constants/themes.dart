
// Theme config for FlexColorScheme version 7.3.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';

// setup with https://rydmike.com/flexcolorscheme/themesplayground-latest/ && https://pub.dev/packages/flex_color_scheme

final lightTheme = FlexThemeData.light(
  colors: const FlexSchemeColor(
    primary: Color(0xff2ec4e5),
    primaryContainer: Color(0xff2e41e5),
    secondary: Color(0xfff16767),
    secondaryContainer: Color(0xfff18867),
    tertiary: Color(0xff2e314a),
    tertiaryContainer: Color(0xffbe4a4a),
    appBarColor: Color(0xfff18867),
    error: Color(0xffb00020),
  ),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 10,
    blendOnColors: false,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);

final darkTheme = FlexThemeData.dark(
  colors: const FlexSchemeColor(
    primary: Color(0xff2ec4e5),
    primaryContainer: Color(0xff2e41e5),
    secondary: Color(0xfff16767),
    secondaryContainer: Color(0xfff18867),
    tertiary: Color(0xff2e314a),
    tertiaryContainer: Color(0xffbe4a4a),
    appBarColor: Color(0xfff18867),
    error: Color(0xffb00020),
  ).defaultError.toDark(10, true),
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    alignedDropdown: true,
    useInputDecoratorThemeInDialogs: true,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
// To use the Playground font, add GoogleFonts package and uncomment
// fontFamily: GoogleFonts.notoSans().fontFamily,
);
// If you do not have a themeMode switch, uncomment this line
// to let the device system mode control the theme mode:
// themeMode: ThemeMode.system,
