import 'package:covid_app/utils/datasource.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
class ThemeClass{
  static ThemeData  lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black12,
    )
  );


 
 static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    colorScheme: const ColorScheme.dark(),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
      )
  );
}
 