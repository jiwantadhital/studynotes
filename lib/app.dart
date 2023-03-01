// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/controllers/news_controller.dart';
import 'package:studynotes/controllers/notices_controller.dart';
import 'package:studynotes/logic/news/bloc/news_bloc.dart';
import 'package:studynotes/logic/notices/bloc/notices_bloc.dart';
import 'package:studynotes/presentation/splash/splash_screen.dart';
import 'package:studynotes/resources/colors.dart';

class App extends StatelessWidget {
  final String flavor;
  const App({
    Key? key,
    required this.flavor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<NewsBloc>(
            create: (BuildContext context) => NewsBloc(newsController: NewsController())..add(NewsGetEvent())
          ),
          BlocProvider<NoticesBloc>(
            create: (BuildContext context) => NoticesBloc(noticeController: NoticeController())..add(NoticeGetEvent())
          ),
    ], child: MaterialApp(
      title: "Study Notes",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorManager.primaryColor, 
    statusBarIconBrightness: Brightness.light, 
    statusBarBrightness: Brightness.light, 
      ),
      backgroundColor: ColorManager.primaryColor
        ),
        buttonColor: ColorManager.boxBlue,
        hoverColor: ColorManager.boxGreen,
        // canvasColor: Colors.white,
        primaryColor: ColorManager.primaryColor,
      ),
      home: SplashView()
    ));
  }
}
