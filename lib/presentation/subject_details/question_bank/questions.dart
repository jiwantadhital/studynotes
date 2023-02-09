import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/subject_details/question_bank/drawer/drawer_items.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class Questions extends StatefulWidget {
  const Questions({super.key});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        backgroundColor: ColorManager.primaryColor,
        width: 200,
        child: DrawerItems()
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
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.closeDrawer();
            }
            else{
              scaffoldKey.currentState!.openDrawer();
            }
      setState(() {
        
      });
            },
            child: Icon(Icons.menu,)),
          )
        ],
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(color: ColorManager.textColorWhite, text: "Question - 2017", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
          scaleDuration: const Duration(milliseconds: 600),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 10),
              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                  "https://www.merospark.com/img/documents/68d13cf26c4b4f4f932e3eff990093ba81f421da7f32b29a38d517554aeb6757/68d13cf26c4b4f4f932e3eff990093ba81f421da7f32b29a38d517554aeb6757.jpg"
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