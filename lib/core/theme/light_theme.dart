part of theme_manager;

ThemeData lightTheme = FlexThemeData.light(
  scheme: FlexScheme.deepPurple,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 7,
  appBarElevation: 1.5,
  subThemesData: const FlexSubThemesData(
      blendOnLevel: 10,
      blendOnColors: false,
      useTextTheme: true,
      useM2StyleDividerInM3: true,
      elevatedButtonRadius: 4.0,
      appBarCenterTitle: true,
      filledButtonRadius: 4.0,
      snackBarBackgroundSchemeColor: SchemeColor.error,
      segmentedButtonSchemeColor: SchemeColor.primary),
  textTheme: const TextTheme(
    titleSmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
