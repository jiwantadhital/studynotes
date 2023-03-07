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
      backgroundColor: Colors.grey[200],
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
        margin: EdgeInsets.only(top: 5,bottom: 5),
        child: ListView.builder(
          itemCount: 9,
          itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return NotesDetails();
              }));
            },
            child: Container(
              margin: EdgeInsets.only(top: 5,bottom: 5),
              height: 80,
              width: size.width,
              decoration: BoxDecoration(
                // gradient: LinearGradient(colors: [
                //  ColorManager.boxBlue,
                //  Colors.lightBlue
                // ]),
                color: Colors.white,
                // borderRadius: BorderRadius.circular(10)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Row(
                children: [
                  SizedBox(width: 5,),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      shape: BoxShape.circle,
                      border: Border.all(width: 3,color: Color.fromARGB(255, 234, 233, 233))
                    ),
                    child: Center(
                      child: DText(
                        color: Colors.white,
                        family: FontConstants.fontPoppins,
                        weight: FontWeightManager.bold,
                        text: "${index+1}",
                        size: FontSize.s16,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: size.width*0.72,
                    child: DText(
                      lines: 2,
                      color: ColorManager.textColorBlack,
                      family: FontConstants.fontPoppins,
                      text: "Introduction and the base of every around the math",
                      weight: FontWeightManager.regular,
                      size: FontSize.s15,
                    ),
                  )
                ],
              ),
              Icon(Icons.arrow_circle_down,color: ColorManager.primaryColor,size: 35,),
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