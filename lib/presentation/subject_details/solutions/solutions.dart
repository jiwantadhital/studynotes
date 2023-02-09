import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/subject_details/solutions/drawer/solution_drawers.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class Solutions extends StatefulWidget {
  const Solutions({super.key});

  @override
  State<Solutions> createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
    final scaffoldKey1 = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey1,
      drawer: Drawer(
        backgroundColor: ColorManager.primaryColor,
        width: 200,
        child: SolutionDrawer()
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
            if(scaffoldKey1.currentState!.isDrawerOpen){
              scaffoldKey1.currentState!.closeDrawer();
            }
            else{
              scaffoldKey1.currentState!.openDrawer();
            }
      setState(() {
        
      });
            },
            child: Icon(Icons.menu,)),
          )
        ],
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(color: ColorManager.textColorWhite, text: "Solution - 2017", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
          scaleDuration: const Duration(milliseconds: 600),
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 10),
              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                  "https://www.theannexeproject.com/wp-content/uploads/2022/05/2017-A-level-H2-Mathematics-Paper-1-Solutions_Page_02.jpg"
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