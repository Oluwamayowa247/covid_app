import 'package:covid_app/pages/homepage.dart';
import 'package:covid_app/theme/thememanager.dart';
import 'package:covid_app/utils/datasource.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/services.dart';

void main() {
  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
  //runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                    backgroundColor: primaryBlack,
                  ),
                  fontFamily: 'Mukta'),
              debugShowCheckedModeBanner: false,
              home:  HomePage(),
              // );
            );
    //   return MaterialApp(
    //   // //themeMode: ThemeMode.system,

    //themeMode: ThemeMode.system,
    //  theme: ThemeClass.lightTheme,
  }
}
