import 'package:covid_app/pages/homepage.dart';
import 'package:covid_app/utils/datasource.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        appBarTheme: AppBarTheme(backgroundColor: primaryBlack),
        fontFamily: 'Mukta'),
    debugShowCheckedModeBanner: false,
    home: const HomePage(),
  ));
}
