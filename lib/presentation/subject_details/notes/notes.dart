import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/notes/allNotes/bloc/allnotes_bloc.dart';
import 'package:studynotes/logic/notes/chapters/bloc/chapter_bloc.dart';
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
    final _counterNotifier1 = ValueNotifier<int>(0);
    int? chaptId;

  Timer? timer;
  bool active = true;
 deactive(){
  active = false;
  Timer _timer =  Timer(const Duration(seconds: 13), () {
    timer!.cancel();
      setState(() {
        active = true;
      });
    });
}
decrease(){
 timer= Timer.periodic(Duration(seconds: 1), (timer) {
        _counterNotifier1.value=_counterNotifier1.value+10;
     });
}
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
      body: BlocBuilder<ChapterBloc,ChapterState>(builder: (context,state){
        if(state is ChapterLoading){
          return Center(child: CircularProgressIndicator());
        }
        if(state is ChapterGot){
          return Container(
        margin: EdgeInsets.only(top: 5,bottom: 5),
        child: ListView.builder(
          itemCount: state.chapterModel.length,
          itemBuilder: (context,index){
            chaptId=state.chapterModel[index].id;
          return GestureDetector(
            onTap: (){
              context.read<AllnotesBloc>()..add(AllnotesGettingEvent(id: state.chapterModel[index].id!.toInt()));
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return NotesDetails();
              }));
            },
            child: Container(
              margin: EdgeInsets.only(top: 5,bottom: 5),
              height: 80,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.white,
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
                        text: state.chapterModel[index].number.toString(),
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
                      text: state.chapterModel[index].name.toString(),
                      weight: FontWeightManager.regular,
                      size: FontSize.s15,
                    ),
                  )
                ],
              ),
               GestureDetector(
                onTap: (){
                  context.read<AllnotesBloc>()..add(AllnotesGettingEvent(id: state.chapterModel[index].id!.toInt()));
                  var data = context.read<AllnotesBloc>().notesController.allNotesModel.id;

                  print(data);
                  
                },
                child:Icon(Icons.arrow_circle_down,color: ColorManager.primaryColor,size: 35,)),
          
              
              SizedBox(width: 5,)
              ],
              )
            ),
          );
        }),
      );
        }
        if(state is ChapterError){
                  return Center(child: Text(state.message));
        }
        return Center(child: Text("Something Went Wrong"));
      }),
      floatingActionButton: GestureDetector(
        onTap: (){
          deactive();
          decrease();
        },
        child:ValueListenableBuilder(valueListenable: _counterNotifier1, builder: (context,value,child){
          return Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorManager.boxBlue
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
          
              Align(
                alignment: Alignment.centerLeft,
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  height: 50,
                  width: value.toDouble(),
                  decoration: BoxDecoration(
                    borderRadius:value!=120? BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ):BorderRadius.circular(10),
                    color: ColorManager.primaryColor
                  ),
         
                ),
              ),
                  Positioned(child: DText(color: Colors.white,
       text:value>10&&value<120?"Downloading...":value==120?"Downloaded":"Download All", weight: FontWeightManager.semibold, family: FontConstants.fontNunito, size: FontSize.s13)),
            ],
          ),
        );
        }
        )
      )
    );
  }
}