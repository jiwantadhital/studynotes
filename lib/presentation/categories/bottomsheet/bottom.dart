import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/subject_details/notes/notes.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class BottomOfCategories extends StatefulWidget {

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
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height*0.65,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        children: [
          SizedBox(height: 10,),
          DText(color: ColorManager.textColorBlack, text: "Basic of computing and Math", weight: FontWeightManager.medium, family: FontConstants.fontPoppins, size: FontSize.s16),
          SizedBox(height: 20,),
          BottomWidget(extend: extend, size: size,text: "Syllabus",),
          SizedBox(height: 15,),
          GestureDetector(
            onTap: (){
              Navigator.push(context, 
          MaterialPageRoute(builder: (context){
            return Notes();
          })
              );
            },
            child: BottomWidget(extend: extend, size: size,text: "Notes",
            ),
          ),
                    SizedBox(height: 15,),
          BottomWidget(extend: extend, size: size,text: "Question Bank",),
                    SizedBox(height: 15,),
          BottomWidget(extend: extend, size: size,text: "Solutions",),
                    SizedBox(height: 15,),
          BottomWidget(extend: extend, size: size,text: "Extra Notes",),
                    SizedBox(height: 15,),
          BottomWidget(extend: extend, size: size,text: "Labs",),
        ],
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
        color: ColorManager.boxGreen,
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