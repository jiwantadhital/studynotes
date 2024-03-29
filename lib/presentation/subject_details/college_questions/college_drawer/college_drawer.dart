import 'package:flutter/material.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../../home_pages/widgets/home_page_widgets.dart';

class CollegeDrawer extends StatelessWidget {
  const CollegeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 40),
              height: 100,
              width: 200,
              decoration: const BoxDecoration(
              ),
              child: Center(
                child: DText(color: ColorManager.textColorWhite, text: "Select The Year", weight: FontWeightManager.bold, family: FontConstants.fontNoto, size: FontSize.s14),
              ),
            ),
            const SizedBox(height: 10,),
            const Divider(
              height: 4,
              color: Colors.white,
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 50,
                        width: 200,
                        child: DText(color: ColorManager.textColorWhite, text: "2017", weight: FontWeightManager.semibold, family: FontConstants.fontNunito, size: FontSize.s13),
                      ),
                      const Divider(
              height: 2,
              color: Colors.white,
            ),
                    ],
                  );
              }),
            )
          ],
        );
  }
}