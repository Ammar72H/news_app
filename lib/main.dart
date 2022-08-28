import 'package:flutter/material.dart';
import 'package:news/modules/home/home_screen.dart';
import 'package:news/providers/my_provider.dart';
import 'package:news/shared/styles/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
      },
      theme: MyThemeData.lightTheme,
      // darkTheme: MyThemeData.darkTheme,

    );

  }
}
