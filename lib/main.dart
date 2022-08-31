import 'package:flutter/material.dart';
import 'package:news/modules/home/details/news_details_screen.dart';
import 'package:news/modules/home/home_screen.dart';
import 'package:news/modules/home/setting_items.dart';
import 'package:news/providers/my_provider.dart';
import 'package:news/shared/styles/my_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (_) => MyProviderApp(), child: MyApp()),
  ],
  child: MyApp(),));
}

class MyApp extends StatelessWidget {
  late MyProviderApp myProviderApp;
  @override
  Widget build(BuildContext context) {
    myProviderApp = Provider.of<MyProviderApp>(context);
    return MaterialApp(
      locale: Locale(myProviderApp.AppLanguage),
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context) => HomeScreen(),
        NewsDetailsScreen.routeName:(context) => NewsDetailsScreen(),
        SettingItems.routeName:(context) => SettingItems(),
      },
      theme: MyThemeData.lightTheme,
      // darkTheme: MyThemeData.darkTheme,

    );

  }
}
