import 'package:chamados/app/constans/pallete.dart';
import 'package:flutter/material.dart';


ThemeData lightTheme = ThemeData(
  
  useMaterial3: true,

  inputDecorationTheme: const InputDecorationTheme(
    contentPadding:  EdgeInsets.all(23),
    labelStyle:  TextStyle(
      color: Pallete.backgroundColor
    ),
    border:  OutlineInputBorder(),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Pallete.gradient3,
        width: 2,
      ),
    ),    
  ),


  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsets>(const EdgeInsets.all(23)), 
      backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3), 
      minimumSize: MaterialStateProperty.all<Size>(
        const Size.fromHeight(65),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(4),
        ),
      ),
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(fontSize:16),
      ),
    ),
  ),

  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.all<Color>(Pallete.gradient3),  
  ),

  
  
  /*brightness: Brightness.light,
  primaryColor: Pallete.gradient3,

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Pallete.gradient3
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
         const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0),
      ),
      minimumSize: MaterialStateProperty.all<Size>(
        const Size(410, 65),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(Pallete.gradient3)
    )
  ),
  
  inputDecorationTheme: const InputDecorationTheme(
    filled: true,
    fillColor: Colors.white,
  )
*/

  appBarTheme: const AppBarTheme(
    backgroundColor: Pallete.gradient3,
    foregroundColor: Colors.white,
    centerTitle: true,
  ),

  
);

ThemeData darkTheme = ThemeData(

    useMaterial3: true,
    
    brightness: Brightness.dark,
   /* 
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(Colors.grey),
      thumbColor: MaterialStateProperty.all<Color>(Colors.white),
    ),
    
    
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)
    ),
  
  
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
             const  EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
          ),
          
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        overlayColor: MaterialStateProperty.all<Color>(Colors.black26)
      )
  ),
  */
  appBarTheme: AppBarTheme(
    backgroundColor: Pallete.gradient3, 
  ),

);
