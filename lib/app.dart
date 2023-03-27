// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/controllers/auth_controller.dart';
import 'package:studynotes/controllers/institute_controller.dart';
import 'package:studynotes/controllers/news_controller.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/controllers/notices_controller.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_controller.dart';
import 'package:studynotes/logic/allsubjects/bloc/allsubject_bloc.dart';
import 'package:studynotes/logic/auth/editProfile/bloc/editprofile_bloc.dart';
import 'package:studynotes/logic/auth/getProfile/bloc/profile_bloc.dart';
import 'package:studynotes/logic/auth/google/bloc/google_bloc.dart';
import 'package:studynotes/logic/auth/login/bloc/login_bloc.dart';
import 'package:studynotes/logic/auth/otp/bloc/otp_bloc.dart';
import 'package:studynotes/logic/auth/register/bloc/register_bloc.dart';
import 'package:studynotes/logic/database/chapter_load/bloc/loadchapter_bloc.dart';
import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';
import 'package:studynotes/logic/institute/comments/bloc/comments_bloc.dart';
import 'package:studynotes/logic/institute/images/bloc/image_bloc.dart';
import 'package:studynotes/logic/institute/main/bloc/institute_bloc.dart';
import 'package:studynotes/logic/institute/pcomments/bloc/pcomments_bloc.dart';
import 'package:studynotes/logic/news/bloc/news_bloc.dart';
import 'package:studynotes/logic/notes/allNotes/bloc/allnotes_bloc.dart';
import 'package:studynotes/logic/notes/chapters/bloc/chapter_bloc.dart';
import 'package:studynotes/logic/notes/lab/bloc/lab_bloc.dart';
import 'package:studynotes/logic/notes/qyear/bloc/qyear_bloc.dart';
import 'package:studynotes/logic/notes/semesters/bloc/semesters_bloc.dart';
import 'package:studynotes/logic/notes/subjects/bloc/subjects_bloc.dart';
import 'package:studynotes/logic/notes/syllabus/bloc/syllabus_bloc.dart';
import 'package:studynotes/logic/notices/bloc/notices_bloc.dart';
import 'package:studynotes/logic/questions/bloc/question_bloc.dart';
import 'package:studynotes/logic/solution/bloc/solutions_bloc.dart';
import 'package:studynotes/logic/thisWeek/bloc/t_week_bloc.dart';
import 'package:studynotes/logic/todayNotice/bloc/t_notice_bloc.dart';
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
          BlocProvider<SolutionsBloc>(
            create: (BuildContext context) => SolutionsBloc(notesController: NotesController())
          ),
          BlocProvider<LabBloc>(
            create: (BuildContext context) => LabBloc(notesController: NotesController())
          ),
          BlocProvider<ChaptersBloc>(
            create: (BuildContext context) => ChaptersBloc(chapterDatabaseController: ChapterDatabaseController())
          ),
          BlocProvider<LoadchapterBloc>(
            create: (BuildContext context) => LoadchapterBloc(chapterDatabaseController: ChapterDatabaseController())..add(LoadingAllChapterEvent())
          ),
            BlocProvider<QyearBloc>(
            create: (BuildContext context) => QyearBloc(notesController: NotesController())..add(QyearGettingEvent())
          ),
            BlocProvider<QuestionBloc>(
            create: (BuildContext context) => QuestionBloc(notesController: NotesController())
          ),
            BlocProvider<AllsubjectBloc>(
            create: (BuildContext context) => AllsubjectBloc(notesController: NotesController())..add(AllSubjectGettingEvent())
          ),
           BlocProvider<SemestersBloc>(
            create: (BuildContext context) => SemestersBloc(notesController: NotesController())..add(SemesterGettingEvent())
          ),
          BlocProvider<NoticesBloc>(
            create: (BuildContext context) => NoticesBloc(noticeController: NoticeController())..add(NoticeGetEvent())
          ),
          BlocProvider<TNoticeBloc>(
            create: (BuildContext context) => TNoticeBloc(noticeController: NoticeController())..add(TNoticeGettingEvent())
          ),
          BlocProvider<TWeekBloc>(
            create: (BuildContext context) => TWeekBloc(noticeController: NoticeController())..add(TweekGettingEvent())
          ),
           BlocProvider<ProfileBloc>(
            create: (BuildContext context) => ProfileBloc(authController: AuthController())..add(GetProfileEvent())
          ),
          BlocProvider<LoginBloc>(
            create: (BuildContext context) => LoginBloc(authController: AuthController()),
          ),
          BlocProvider<RegisterBloc>(
            create: (BuildContext context) => RegisterBloc(authController: AuthController()),
          ),
           BlocProvider<GoogleBloc>(
            create: (BuildContext context) => GoogleBloc(authController: AuthController()),
          ),
          BlocProvider<InstituteBloc>(
            create: (BuildContext context) => InstituteBloc(instituteController: InstituteController())..add(InstituteGettingEvent()),
          ),
          BlocProvider<ImageBloc>(
            create: (BuildContext context) => ImageBloc(instituteController: InstituteController()),
          ),
          BlocProvider<CommentsBloc>(
            create: (BuildContext context) => CommentsBloc(instituteController: InstituteController()),
          ),
          BlocProvider<PcommentsBloc>(
            create: (BuildContext context) => PcommentsBloc(instituteController: InstituteController()),
          ),
           BlocProvider<EditprofileBloc>(
            create: (BuildContext context) => EditprofileBloc(authController: AuthController()),
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
