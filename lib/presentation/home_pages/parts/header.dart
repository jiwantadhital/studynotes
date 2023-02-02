import 'package:flutter/material.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../../resources/colors.dart';

class TopHeader extends StatelessWidget {
  const TopHeader({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          children: [
            Container(
              height: 70,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2,color: Colors.white),
                      image: const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsynwv-5qtogtOwJbIjaPFJUmHpzhxgqIAug&usqp=CAU"),fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DText(
                        family: FontConstants.fontPoppins,
                        weight: FontWeightManager.bold,
                        size: FontSize.s16,
                        color: ColorManager.textColorWhite,
                        text: "Hello, User",
                        
                      ),
                      DText(
                        family: FontConstants.fontPoppins,
                        weight: FontWeightManager.light,
                        size: FontSize.s14,
                        color: ColorManager.textColorWhite,
                        text: "Let's start learning",
                        
                      ),
                    ],
                  ),
                  SizedBox(
                    width: size.width*0.30,
                  ),
                    Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2,color: Colors.white),
                    ),
                    child: Stack(
                        alignment: Alignment.center,
                      children: [
                        const Icon(Icons.notifications,size: 30,),
                        Positioned(
                          left: 20,
                          bottom: 22,
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: DText(text: "5",color: Colors.white,size: 8,weight: FontWeight.w800,family: FontConstants.fontPoppins,)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Search for all courses",
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      icon: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.search,color: Colors.grey,),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Center(child: Icon(Icons.menu),),
                  ),
                  ),
              ],
            ),
            const SizedBox(height: 40,)
          ],
      )
      );
  }
}

