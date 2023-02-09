import 'package:flutter/material.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/subject_details/college_questions/college_drawer/college_drawer.dart';
import 'package:studynotes/presentation/subject_details/solutions/drawer/solution_drawers.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class CollegeQuestions extends StatefulWidget {
  const CollegeQuestions({super.key});

  @override
  State<CollegeQuestions> createState() => _CollegeQuestionsState();
}

class _CollegeQuestionsState extends State<CollegeQuestions> {
    final scaffoldKey2 = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey2,
      drawer: Drawer(
        backgroundColor: ColorManager.primaryColor,
        width: 200,
        child: CollegeDrawer()
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back)),
        actions: [
          Padding(padding: 
          EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: (){
            if(scaffoldKey2.currentState!.isDrawerOpen){
              scaffoldKey2.currentState!.closeDrawer();
            }
            else{
              scaffoldKey2.currentState!.openDrawer();
            }
      setState(() {
        
      });
            },
            child: Icon(Icons.menu,)),
          )
        ],
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(color: ColorManager.textColorWhite, text: "College Questions - 2017", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
                  scaleDuration: const Duration(milliseconds: 600),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 10),
              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                  "https://image.slidesharecdn.com/6d2487ee-7eb5-4463-be73-405ffcf801ac-160421012703/85/5-questions-for-the-department-chair-of-your-major-1-638.jpg?cb=1667667298"
                ),
                fit: BoxFit.contain
                )
              ),
            );
        }),
      ),
    );
  }
}