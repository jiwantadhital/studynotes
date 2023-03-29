import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_controller.dart';
import 'package:studynotes/logic/database/chapter_load/bloc/loadchapter_bloc.dart';
import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';
import 'package:studynotes/logic/notes/allNotes/bloc/allnotes_bloc.dart';
import 'package:studynotes/logic/notes/chapters/bloc/chapter_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/subject_details/notes/functions/notes_function.dart';
import 'package:studynotes/presentation/subject_details/notes/note_details/notes_details.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class Notes extends StatefulWidget {
  int id;
  Notes({super.key, required this.id});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  int cIndex = 0;
  int downloadStage = 1;
  ChapterDatabaseController chapterDatabaseController =
      ChapterDatabaseController();
  List local = [];
  List chapters = [];
  NotesFunction notesFunction = NotesFunction();
  bool active = true;
  bool done = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<LoadchapterBloc>().add(LoadingAllChapterEvent());
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorManager.primaryColor,
          elevation: 1.5,
          title: DText(
            text: "Chapters",
            color: Colors.white,
            family: FontConstants.fontPoppins,
            weight: FontWeightManager.semibold,
            size: FontSize.s16,
          ),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.primaryColor,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
        body: BlocConsumer<ChapterBloc, ChapterState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is ChapterLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ChapterGot) {
                return Container(
                  margin: EdgeInsets.only(top: 5, bottom: 5),
                  child: ListView.builder(
                      itemCount: state.chapterModel.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.read<AllnotesBloc>().add(
                                AllnotesGettingEvent(
                                    id: state.chapterModel[index].id!.toInt()));
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NotesDetails(
                                chaptername:
                                    state.chapterModel[index].name ?? "",
                                number: state.chapterModel[index].number ?? 0,
                              );
                            }));
                          },
                          child: BlocConsumer<ChaptersBloc, ChaptersState>(
                            listener: (context, te) {
                              if(te is ChaptersLoading){
                              //  DialogBox().dialogbox(context);
                                  // downloadStage=2;
                              }
                              if(te is ChaptersAdded){
                                // downloadStage=3;
                                  Navigator.pop(context);
                                  // Future.delayed(Duration(milliseconds: 50),(){
                                  //    context
                                  //                                 .read<
                                  //                                     LoadchapterBloc>()
                                  //                                 .add(
                                  //                                     LoadingAllChapterEvent());
                                  // }).whenComplete(() {
                                                                                                   

                                  // });
                                  setState(() {
                                    
                                  });
                              }
                              if(te is ChaptersError){Navigator.pop(context);
                                // downloadStage=4;   
                              }
                            },
                            builder: (context, te) {
                              return BlocConsumer<LoadchapterBloc,
                                  LoadchapterState>(
                                listener: (context, stae) {
                                  if (stae is LoadChapterLoaded) {
                                    local = stae.allData;
                                  }
                                },
                                builder: (context, sta) {
                                  if (sta is LoadChapterLoaded) {
                                    return Container(
                                        margin:
                                            EdgeInsets.only(top: 5, bottom: 5),
                                        height: 80,
                                        width: size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                  height: 50,
                                                  width: 50,
                                                  decoration: BoxDecoration(
                                                      color: ColorManager
                                                          .primaryColor,
                                                      shape: BoxShape.circle,
                                                      border: Border.all(
                                                          width: 3,
                                                          color: Color.fromARGB(
                                                              255,
                                                              234,
                                                              233,
                                                              233))),
                                                  child: Center(
                                                    child: DText(
                                                      color: Colors.white,
                                                      family: FontConstants
                                                          .fontPoppins,
                                                      weight: FontWeightManager
                                                          .bold,
                                                      text: state
                                                          .chapterModel[index]
                                                          .number
                                                          .toString(),
                                                      size: FontSize.s16,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  width: size.width * 0.72,
                                                  child: DText(
                                                    lines: 2,
                                                    color: ColorManager
                                                        .textColorBlack,
                                                    family: FontConstants
                                                        .fontPoppins,
                                                    text: state
                                                        .chapterModel[index]
                                                        .name
                                                        .toString(),
                                                    weight: FontWeightManager
                                                        .regular,
                                                    size: FontSize.s15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                         sta.allData.contains(state
                                                    .chapterModel[index].id)
                                                ? Icon(
                                                    Icons.done,
                                                    color: ColorManager
                                                        .primaryColor,
                                                    size: 35,
                                                  )
                                           
                                                    : GestureDetector(
                                                        onTap: () async {
                                                          DialogBox().dialogbox(context);
                                                           DialogBox().dialogbox(context);
                                                            DialogBox().dialogbox(context);
                                                          cIndex = index;

                                                          try {
                                                            notesFunction
                                                                .dataSave(
                                                              state
                                                                  .chapterModel[
                                                                      index]
                                                                  .id,
                                                              context,
                                                            );
                                                          
                                                          } catch (e) {

                                                          }
                                                       
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .arrow_circle_down_outlined,
                                                          color: ColorManager
                                                              .primaryColor,
                                                          size: 35,
                                                        )),
                                            SizedBox(
                                              width: 5,
                                            )
                                          ],
                                        ));
                                  }
                                  if (sta is LoadChapterError) {
                                    return Text("Er");
                                  }
                                  return Container();
                                },
                              );
                            },
                          ),
                        );
                      }),
                );
              }
              if (state is ChapterError) {
                return Center(child: Text(state.message));
              }
              return Center(child: Text("Something Went Wrong"));
            }),
        floatingActionButton: BlocBuilder<LoadchapterBloc, LoadchapterState>(
          builder: (context, stte) {
            if (stte is LoadChapterLoaded) {
              return BlocBuilder<ChapterBloc, ChapterState>(
                builder: (context, state) {
                  if (state is ChapterGot) {
                    if (state.chapterId
                        .every((item) => stte.allData.contains(item))) {
                      return Container(
                          height: 50,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.primaryColor),
                          child: Center(
                            child: DText(
                                color: Colors.white,
                                text: state.chapterId.isEmpty
                                    ? "No Data"
                                    : "Downloaded",
                                weight: FontWeightManager.semibold,
                                family: FontConstants.fontNunito,
                                size: FontSize.s13),
                          ));
                    } else {
                      return done == false
                          ? GestureDetector(
                              onTap: () {
                                  DialogBox().dialogbox(context);
                                                           DialogBox().dialogbox(context);
                                                            DialogBox().dialogbox(context);
                                try {
                                  for (int i = 0;
                                      i < state.chapterModel.length;
                                      i++) {
                                      
                                        cIndex=i;
                                   
                                    notesFunction.dataSave(
                                        state.chapterModel[i].id, context);
                                     
                                  }
                                  // Future.delayed(Duration(milliseconds: 300),(){
                                        
                                  // });
                                  setState(() {
                                    done = true;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      ShowSnackBar().snack(
                                          "All Chapters are downloaded successfully",
                                          ColorManager.primaryColor));
                                } catch (e) {
                                  done = false;
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      ShowSnackBar().snack(
                                          "Something went wrong", Colors.red));
                                }
                              },
                              child: Container(
                                  height: 50,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorManager.primaryColor),
                                  child: Center(
                                    child: DText(
                                        color: Colors.white,
                                        text: "Download All",
                                        weight: FontWeightManager.semibold,
                                        family: FontConstants.fontNunito,
                                        size: FontSize.s13),
                                  )))
                          : Container(
                              height: 50,
                              width: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: ColorManager.primaryColor),
                              child: Center(
                                child: DText(
                                    color: Colors.white,
                                    text: "Downloaded",
                                    weight: FontWeightManager.semibold,
                                    family: FontConstants.fontNunito,
                                    size: FontSize.s13),
                              ));
                    }
                  }
                  return Container();
                },
              );
            }
            return Container();
          },
        ));
  }
}
