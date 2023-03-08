// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/controllers/auth_controller.dart';
import 'package:studynotes/controllers/news_controller.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/controllers/notices_controller.dart';
import 'package:studynotes/logic/auth/login/bloc/login_bloc.dart';
import 'package:studynotes/logic/auth/otp/bloc/otp_bloc.dart';
import 'package:studynotes/logic/auth/register/bloc/register_bloc.dart';
import 'package:studynotes/logic/news/bloc/news_bloc.dart';
import 'package:studynotes/logic/notes/allNotes/bloc/allnotes_bloc.dart';
import 'package:studynotes/logic/notes/chapters/bloc/chapter_bloc.dart';
import 'package:studynotes/logic/notes/qyear/bloc/qyear_bloc.dart';
import 'package:studynotes/logic/notes/semesters/bloc/semesters_bloc.dart';
import 'package:studynotes/logic/notes/subjects/bloc/subjects_bloc.dart';
import 'package:studynotes/logic/notes/syllabus/bloc/syllabus_bloc.dart';
import 'package:studynotes/logic/notices/bloc/notices_bloc.dart';
import 'package:studynotes/logic/questions/bloc/question_bloc.dart';
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
            BlocProvider<SubjectsBloc>(
            create: (BuildContext context) => SubjectsBloc(notesController: NotesController())..add(SubjectGettingEvent(id: 1))
          ),
            BlocProvider<SyllabusBloc>(
            create: (BuildContext context) => SyllabusBloc(notesController: NotesController())
          ),
            BlocProvider<ChapterBloc>(
            create: (BuildContext context) => ChapterBloc(notesController: NotesController())
          ),
           BlocProvider<AllnotesBloc>(
            create: (BuildContext context) => AllnotesBloc(notesController: NotesController())
          ),
            BlocProvider<QyearBloc>(
            create: (BuildContext context) => QyearBloc(notesController: NotesController())..add(QyearGettingEvent())
          ),
            BlocProvider<QuestionBloc>(
            create: (BuildContext context) => QuestionBloc(notesController: NotesController())
          ),
           BlocProvider<SemestersBloc>(
            create: (BuildContext context) => SemestersBloc(notesController: NotesController())..add(SemesterGettingEvent())
          ),
          BlocProvider<NoticesBloc>(
            create: (BuildContext context) => NoticesBloc(noticeController: NoticeController())..add(NoticeGetEvent())
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(authController: AuthController()),
          ),
          BlocProvider<RegisterBloc>(
            create: (BuildContext context) => RegisterBloc(authController: AuthController()),
          ),
          BlocProvider<OtpBloc>(
            create: (BuildContext context) => OtpBloc(authController: AuthController()),
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
