// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/setting/downloads/downloaded_details.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class DownloadedChapters extends StatefulWidget {
  int id;
  DownloadedChapters({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  State<DownloadedChapters> createState() => _DownloadedChaptersState();
}

class _DownloadedChaptersState extends State<DownloadedChapters> {
  @override
  void initState() {
    context.read<ChaptersBloc>().add(ChaptersGettingEvent(id: widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<ChaptersBloc>().add(ChaptersGettingEvent(id: widget.id));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: ColorManager.primaryColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: ColorManager.primaryColor,
        title: DText(
          text: "Subjects",
          color: ColorManager.textColorWhite,
          weight: FontWeightManager.semibold,
          size: FontSize.s20,
          family: FontConstants.fontNunito,
        ),
      ),
      body: BlocBuilder<ChaptersBloc, ChaptersState>(builder: (context, state) {
        if (state is ChaptersLoading) {
          return Center(
            child: Text("Loading..."),
          );
        }
        if (state is ChaptersLoaded) {
          return ListView.builder(
              itemCount: state.chapterModelDatabase.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                        context.read<ChaptersBloc>().add(ChaptersGettingEvent(id: widget.id));
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DownloadedDetails(
                        id:widget.id,
                          state: index,
                          name: state.chapterModelDatabase[index].c_name);
                    })).then((value) {
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(top: 10, bottom: 5),
                    height: 110,
                    width: double.maxFinite,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.primaryColor,
                              border: Border.all(
                                  width: 3,
                                  color: Color.fromARGB(255, 219, 218, 218))),
                          child: Center(
                            child: DText(
                              text: state.chapterModelDatabase[index].c_number,
                              color: ColorManager.textColorWhite,
                              weight: FontWeightManager.semibold,
                              size: FontSize.s20,
                              family: FontConstants.fontNunito,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.7,
                          // color: Colors.yellow,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: DText(
                                  lines: 2,
                                  text:
                                      state.chapterModelDatabase[index].c_name,
                                  color: ColorManager.textColorBlack,
                                  weight: FontWeightManager.semibold,
                                  size: FontSize.s15,
                                  family: FontConstants.fontPoppins,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10, left: 5),
                                child: DText(
                                  lines: 1,
                                  text: state
                                      .chapterModelDatabase[index].semester,
                                  color: ColorManager.textColorBlack,
                                  weight: FontWeightManager.regular,
                                  size: FontSize.s12,
                                  family: FontConstants.fontPoppins,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }
        if (state is ChaptersError) {
          return Center(child: Text("Error"));
        }
        return Center(
          child: Text("Something went wrong"),
        );
      }),
      floatingActionButton: BlocConsumer<ChaptersBloc, ChaptersState>(
        listener: (context, stat) {
        },
        builder: (context, stat) {
          if(stat is ChaptersLoaded){
        
          return FloatingActionButton.extended(
              onPressed: () {
                         for(int i=0;i<stat.chapterModelDatabase.length;i++){
                               context.read<ChaptersBloc>().add(ChaptersDeletingEvent(id: stat.chapterModelDatabase[i].id!.toInt()));
                  }
                  Navigator.pop(context);

                
              },
              label: Center(
                child: Text("Delete Subject"),
              ));
              }
              return Container();
        },
      ),
    );
  }
}
