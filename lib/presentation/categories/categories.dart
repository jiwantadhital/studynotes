import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studynotes/presentation/categories/bottomsheet/bottom.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int selected = 1;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 50,
                width: size.width,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                      selected = index;
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10,bottom: 5,right: 7,left: 7),
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                        color: selected==index?ColorManager.boxBlue: ColorManager.boxGreen,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)
                        ),
                        border: Border.all(width: 2,color: Colors.white),
                      ),
                      child: Center(
                        child: DText(color: ColorManager.textColorWhite, text: "Sem 1", weight: FontWeightManager.semibold, family: FontConstants.fontPoppins, size: FontSize.s16),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    color: Colors.white,
                     borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                  ),
                  child: Column(
                    children: [
                      DText(color: ColorManager.textColorBlack,
                      text: "Subjects",
                      weight: FontWeightManager.semibold, family: FontConstants.fontPoppins, size: FontSize.s16),
                      SizedBox(height: 10,),
                      Expanded(
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 12,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,  
                          crossAxisSpacing: 7.0,  
                        childAspectRatio: 2/1.9,
                          mainAxisSpacing: 10.0
                        ), itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                               builder: (BuildContext context) {
                                return BottomOfCategories();
                              }).whenComplete(() {
                                setState(() {
                                  
                                });
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              width: 200,
                              decoration: BoxDecoration(
                                color: ColorManager.boxBlue,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 80,
                                    child: DText(color: ColorManager.textColorWhite, text: "Basic of computing and Math", weight: FontWeightManager.medium, family: FontConstants.fontPoppins, size: FontSize.s13),
                                  ),
                                  Container(
                                    height: 20,
                                    child: DText(color: ColorManager.textColorWhite, text: "Chapters: 12", weight: FontWeightManager.light, family: FontConstants.fontPoppins, size: FontSize.s12),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                      )  ,
                                                        SizedBox(height: 80,)
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

// _subjects(size){
//   return 
// }