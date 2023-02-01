// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  final String flavor;
  final Color color ;
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
        primaryColor: color
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: Text(flavor),
        ),
      ),
    );
  }
}
