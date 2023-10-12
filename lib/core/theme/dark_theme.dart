part of theme_manager;

ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.deepPurple,
  surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
  blendLevel: 13,
  appBarElevation: 1.5,
  subThemesData: const FlexSubThemesData(
    blendOnLevel: 20,
    useTextTheme: true,
    useM2StyleDividerInM3: true,
    elevatedButtonRadius: 4.0,
    filledButtonRadius: 4.0,
    appBarCenterTitle: true,
  ),
  textTheme: const TextTheme(
    titleSmall: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
);
