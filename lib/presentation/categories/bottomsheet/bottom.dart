// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/database/chapter_load/bloc/loadchapter_bloc.dart';
import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';
import 'package:studynotes/logic/notes/chapters/bloc/chapter_bloc.dart';
import 'package:studynotes/logic/notes/syllabus/bloc/syllabus_bloc.dart';
import 'package:studynotes/logic/questions/bloc/question_bloc.dart';
import 'package:studynotes/logic/solution/bloc/solutions_bloc.dart';

import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/subject_details/college_questions/college_questions.dart';
import 'package:studynotes/presentation/subject_details/extra_notes/extra_notes.dart';
import 'package:studynotes/presentation/subject_details/lab_reports/lab_reports.dart';
import 'package:studynotes/presentation/subject_details/notes/notes.dart';
import 'package:studynotes/presentation/subject_details/question_bank/questions.dart';
import 'package:studynotes/presentation/subject_details/solutions/solutions.dart';
import 'package:studynotes/presentation/subject_details/syllabus/syllabus.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class BottomOfCategories extends StatefulWidget {
  String subject;
  int sub_id;
   BottomOfCategories({
    Key? key,
    required this.subject,
    required this.sub_id,
  }) : super(key: key);

  @override
  State<BottomOfCategories> createState() => _BottomOfCategoriesState();
}

class _BottomOfCategoriesState extends State<BottomOfCategories> {
  bool extend = false;
  @override
  void initState() {

    _afterSomeTime();
    super.initState();
  }
  
  _afterSomeTime(){
    Future.delayed(Duration(milliseconds: 100), () {
          extend = true;
      setState(() {
      });
});

  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
       return Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
               Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 140,left: 5),
                child: FloatingActionButton.small(
                  backgroundColor: Colors.white,
                  child: Icon(Icons.close_rounded,color: Colors.red,),
                  onPressed: (){
                                        Navigator.pop(context);
                  }),
              )),
          ],
        ),
        backgroundColor: Colors.transparent,
         body: Align(
          alignment: Alignment.bottomCenter,
           child: Container(
            width: size.width,
               padding: EdgeInsets.all(10),
               height:size.height<687?size.height*0.77: size.height*0.75,
               decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            )
               ),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              DText(
                align: TextAlign.center,
                lines: 2,
                color: ColorManager.textColorBlack, text: widget.subject, weight: FontWeightManager.medium, family: FontConstants.fontPoppins, size: FontSize.s16),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  context.read<SyllabusBloc>()..add(SyllabusGettingEvent(id: widget.sub_id));
                       Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return Syllabus();
              })
                  );
                },
                child: BottomWidget(extend: extend, size: size,text: "Syllabus",)),
              SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                  context.read<ChapterBloc>()..add(ChapterGettingEvent(id: widget.sub_id));
                context.read<LoadchapterBloc>().add(LoadingAllChapterEvent());
                  Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return Notes(id:widget.sub_id);
              })
                  );
                },
                child: BottomWidget(extend: extend, size: size,text: "Notes",
                ),
              ),
                        SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                context.read<QuestionBloc>()..add(QuestionGettingEvent(id: widget.sub_id, year_id: 1));
                    Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return Questions(sub_id: widget.sub_id,);
              })
                  );
                },
                child: BottomWidget(extend: extend, size: size,text: "Question Bank",)),
                SizedBox(height: 15,),
                GestureDetector(
                onTap: (){
                    Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return CollegeQuestions();
              })
                  );
                },
                child: BottomWidget(extend: extend, size: size,text: "College Questions",)),
                        SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                 context.read<SolutionsBloc>()..add(SolutionGettingEvent(id: widget.sub_id, year_id: 1));
                         Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return Solutions(sub_id: widget.sub_id,);
              })
                  );
                },
                child: BottomWidget(extend: extend, size: size,text: "Solutions",)),
                        SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                        Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return ExtraNotes();
              })
                  );
                },
                child: BottomWidget(extend: extend, size: size,text: "Extra Notes",)),
                        SizedBox(height: 15,),
              GestureDetector(
                onTap: (){
                      Navigator.push(context, 
              MaterialPageRoute(builder: (context){
                return Labs();
              })
                  );
                },
                child: BottomWidget(extend: extend, size: size,text: "Labs",)),
            ],
               ),
             ),
         ),
       );
  }
}

class BottomWidget extends StatelessWidget {
   BottomWidget({
    super.key,
    required this.extend,
    required this.size,
    required this.text,
  });
  final String text;
  final bool extend;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      padding: EdgeInsets.only(left: 20),
      alignment: Alignment.centerLeft,
      height: 50,
      width: extend == false?0:size.width,
      decoration: BoxDecoration(
        color: ColorManager.primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: DText(
        color: ColorManager.textColorWhite,
        family: FontConstants.fontPoppins,
        weight: FontWeightManager.medium,
        size: FontSize.s15,
        text: text,
      ),
    );
  }
}