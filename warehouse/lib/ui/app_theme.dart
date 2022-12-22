import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme { 
    return ThemeData( 
      primarySwatch:  Colors.deepOrange,
      scaffoldBackgroundColor: Colors.white,
      buttonTheme: ButtonThemeData( 
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: const Color.fromRGBO(255,127,80, 1)
      )
    );
  }
}