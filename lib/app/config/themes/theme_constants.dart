import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

// Theme config for FlexColorScheme version 7.1.x. Make sure you use
// same or higher package version, but still same major version. If you
// use a lower package version, some properties may not be supported.
// In that case remove them after copying this theme to your app.
ThemeData lightTheme = FlexThemeData.light(
  subThemesData: const FlexSubThemesData(
    
    appBarBackgroundSchemeColor: SchemeColor.primary,
    interactionEffects: false,
    tintedDisabledControls: false,
    blendOnColors: false,
    useTextTheme: true,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorUnfocusedBorderIsColored: false,
    tooltipRadius: 4,
    tooltipSchemeColor: SchemeColor.inverseSurface,
    tooltipOpacity: 0.9,
    snackBarElevation: 6,
    snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
  ),
  visualDensity: FlexColorScheme.comfortablePlatformDensity,
  useMaterial3: true,
  swapLegacyOnMaterial3: true,
  // To use the Playground font, add GoogleFonts package and uncomment
  // fontFamily: GoogleFonts.notoSans().fontFamily,
);
ThemeData darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.limeM3,
  subThemesData: const FlexSubThemesData(
    appBarBackgroundSchemeColor: SchemeColor.onSurface,
    interactionEffects: true,
    tintedDisabledControls: false,
    useTextTheme: true,
    inputDecoratorBorderType: FlexInputBorderType.underline,
    inputDecoratorUnfocusedBorderIsColored: false,
    tooltipRadius: 4,
    tooltipSchemeColor: SchemeColor.inverseSurface,
    tooltipOpacity: 0.9,
    snackBarElevation: 6,
    snackBarBackgroundSchemeColor: SchemeColor.inverseSurface,
    navigationBarSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedLabel: false,
    navigationBarSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationBarMutedUnselectedIcon: false,
    navigationBarIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationBarIndicatorOpacity: 1.00,
    navigationRailSelectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedLabelSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedLabel: false,
    navigationRailSelectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailUnselectedIconSchemeColor: SchemeColor.onSurface,
    navigationRailMutedUnselectedIcon: false,
    navigationRailIndicatorSchemeColor: SchemeColor.secondaryContainer,
    navigationRailIndicatorOpacity: 1.00,
    navigationRailBackgroundSchemeColor: SchemeColor.surface,
    navigationRailLabelType: NavigationRailLabelType.none,
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



// Light and dark ColorSchemes made by FlexColorScheme v7.2.0.
// These ColorScheme objects require Flutter 3.7 or later.''

// ThemeData lightTheme = ThemeData(
  
//   useMaterial3: true,

//   inputDecorationTheme: const InputDecorationTheme(
//     contentPadding:  EdgeInsets.all(23),
//     labelStyle:  TextStyle(
//       color: Pallete.backgroundColor
//     ),
//     border:  OutlineInputBorder(),
//     focusedBorder: OutlineInputBorder(
//       borderSide: BorderSide(
//         color: Pallete.gradient3,
//         width: 2,
//       ),
//     ),    
//   ),


//   filledButtonTheme: FilledButtonThemeData(
//     style: ButtonStyle(
//       padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(23)), 
//       backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3), 
//       minimumSize: MaterialStateProperty.all<Size>(
//         const Size.fromHeight(65),
//       ),
//       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//         RoundedRectangleBorder(
//          borderRadius: BorderRadius.circular(4),
//         ),
//       ),
//       textStyle: MaterialStateProperty.all<TextStyle>(
//         const TextStyle(fontSize:16),
//       ),
//     ),
//   ),

//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3),
//       padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(23)),
//       textStyle: MaterialStateProperty.all<TextStyle>(
//         const TextStyle(fontSize: 14),
//       ),
//       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
//     ),
//   ),


//   checkboxTheme: CheckboxThemeData(
//     fillColor: MaterialStateProperty.all<Color>(Pallete.gradient3),  
//   ),

  
  
//   /*brightness: Brightness.light,
//   primaryColor: Pallete.gradient3,

//   floatingActionButtonTheme: const FloatingActionButtonThemeData(
//     backgroundColor: Pallete.gradient3
//   ),

//   elevatedButtonTheme: ElevatedButtonThemeData(
//     style: ButtonStyle(
//       padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//          const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
//       ),
//       minimumSize: MaterialStateProperty.all<Size>(
//         const Size(410, 65),
//       ),
//       backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3)
//     )
//   ),
  
//   inputDecorationTheme: const InputDecorationTheme(
//     filled: true,
//     fillColor: Colors.white,
//   )
// */

//   appBarTheme: const AppBarTheme(
//     backgroundColor: Pallete.gradient3,
//     foregroundColor: Colors.white,
//     centerTitle: true,
//   ),

  
// );

// ThemeData darkTheme = ThemeData(

//     useMaterial3: true,
    
//     brightness: Brightness.dark,

//   appBarTheme: const AppBarTheme(
//     backgroundColor: Pallete.gradient3,
//     foregroundColor: Colors.white,
//     centerTitle: true,
//   ),
//    /* 
//     switchTheme: SwitchThemeData(
//       trackColor: MaterialStateProperty.all<Color>(Colors.grey),
//       thumbColor: MaterialStateProperty.all<Color>(Colors.white),
//     ),
    
    
//     inputDecorationTheme: InputDecorationTheme(
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none
//         ),
//         filled: true,
//         fillColor: Colors.grey.withOpacity(0.1)
//     ),
  
  
//   elevatedButtonTheme: ElevatedButtonThemeData(
//       style: ButtonStyle(
//           padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
//              const  EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
//           ),
          
//         backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//         foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
//         overlayColor: MaterialStateProperty.all<Color>(Colors.black26)
//       )
//   ),
//   */
// );

