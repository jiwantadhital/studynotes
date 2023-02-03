import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class BottomOfCategories extends StatefulWidget {
  double? width;
   BottomOfCategories({super.key, this.width});

  @override
  State<BottomOfCategories> createState() => _BottomOfCategoriesState();
}

class _BottomOfCategoriesState extends State<BottomOfCategories> {
  @override
  void initState() {
    widget.width = double.maxFinite;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // widget.width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height*0.7,
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
          AnimatedContainer(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.only(left: 20),
            alignment: Alignment.centerLeft,
            height: 50,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: ColorManager.boxGreen,
              borderRadius: BorderRadius.circular(10)
            ),
            child: DText(
              color: ColorManager.textColorWhite,
              family: FontConstants.fontPoppins,
              weight: FontWeightManager.medium,
              size: FontSize.s15,
              text: "Syllabus",
            ),
          )
        ],
      ),
    );
  }
}