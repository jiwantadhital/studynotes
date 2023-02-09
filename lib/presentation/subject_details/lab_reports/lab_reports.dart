import 'package:flutter/material.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class Labs extends StatefulWidget {
  const Labs({super.key});

  @override
  State<Labs> createState() => _LabsState();
}

class _LabsState extends State<Labs> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

 
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(color: ColorManager.textColorWhite, text: "Labs - Basic Math", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
          scaleDuration: const Duration(milliseconds: 600),

        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
            return Container(
              margin: EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 10),
              height: MediaQuery.of(context).size.height*0.85,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                  "https://templatelab.com/wp-content/uploads/2017/08/lab-report-template-01-790x1022.jpg"
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

