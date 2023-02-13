// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:studynotes/presentation/splash/splash_screen.dart';

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
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        canvasColor: Colors.white,
        // primaryColor: color,
        primarySwatch: color,
      ),
      home: SplashView()
    );
  }
}
