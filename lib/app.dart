// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:studynotes/presentation/home_pages/main_page.dart';
import 'package:studynotes/resources/colors.dart';

import 'presentation/bottom_navigation/bottom_navigation_bar.dart';

class App extends StatelessWidget {
  final String flavor;
  final MaterialColor color ;
  const App({
    Key? key,
    required this.flavor,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Study Notes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.transparent,
        ),
        canvasColor: Colors.white,
        // primaryColor: color,
        primarySwatch: color,
      ),
      home: BottomBarPage()
    );
  }
}
