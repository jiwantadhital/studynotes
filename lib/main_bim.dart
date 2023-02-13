import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studynotes/app.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await UserSimplePreferences.init();
  runApp(App(flavor: "BIM",
  color: Colors.pink,
  ));
}