import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studynotes/app.dart';
import 'package:studynotes/firebase_options.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/notification/local_notification.dart';

Future<void> backgroundHandler(RemoteMessage message) async {

	}
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await UserSimplePreferences.init();
  runApp(App(flavor: "BIM",));
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform
  );
    FirebaseMessaging.onBackgroundMessage(backgroundHandler);
      LocalNotificationService.initialize();
}