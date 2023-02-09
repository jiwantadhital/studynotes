import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(color: ColorManager.textColorWhite, text: "Report", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s16),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(height: 10,),
            TextField(
              cursorColor: ColorManager.primaryColor,
              decoration: InputDecoration(
                labelText: "Title",
                labelStyle: TextStyle(
                  color: ColorManager.primaryColor
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryColor
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryColor
                  )
                )
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.text,
              maxLines: 5,
              cursorColor: ColorManager.primaryColor,
              decoration: InputDecoration(
                labelText: "Description",
                labelStyle: TextStyle(
                  color: ColorManager.primaryColor
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryColor
                  )
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: ColorManager.primaryColor
                  )
                )
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              
            }, child: Text("Submit"))
          ],
        ),
      ),
    );
  }
}
