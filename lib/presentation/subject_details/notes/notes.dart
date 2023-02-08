import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/subject_details/notes/note_details/notes_details.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.menu),
          )
        ],
        backgroundColor: ColorManager.primaryColor,
        elevation: 1.5,
        title: Center(child: DText(
        text: "Chapters",color: Colors.white,
        family: FontConstants.fontPoppins,
        weight: FontWeightManager.semibold,
        size: FontSize.s16,
        )),
        systemOverlayStyle:  SystemUiOverlayStyle(
          statusBarColor: ColorManager.primaryColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return NotesDetails();
              }));
            },
            child: Container(
              margin: EdgeInsets.all(5),
              height: 60,
              width: size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                 ColorManager.boxBlue,
                 Colors.lightBlue
                ]),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Row(
                children: [
                  SizedBox(width: 10,),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: ColorManager.boxGreen,
                      shape: BoxShape.circle,
                      border: Border.all(width: 3,color: Colors.white)
                    ),
                    child: Center(
                      child: DText(
                        color: Colors.white,
                        family: FontConstants.fontPoppins,
                        weight: FontWeightManager.bold,
                        text: "1",
                        size: FontSize.s16,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: size.width*0.6,
                    child: DText(
                      lines: 2,
                      color: ColorManager.textColorWhite,
                      family: FontConstants.fontPoppins,
                      text: "Chapter 1 - Introduction",
                      weight: FontWeightManager.semibold,
                      size: FontSize.s15,
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_circle_right_sharp,color: Colors.white,),
              SizedBox(width: 5,)
              ],
              )
            ),
          );
        }),
      ),
    );
  }
}