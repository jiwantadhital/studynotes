// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart' as html;
import 'package:studynotes/logic/database/chapter_load/bloc/loadchapter_bloc.dart';
import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';

import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';

import '../../../resources/fonts.dart';

class DownloadedDetails extends StatefulWidget {
  int id;
  var state;
  var name;
  DownloadedDetails({
    Key? key,
    required this.id,
    required this.state,
    required this.name,
  }) : super(key: key);

  @override
  State<DownloadedDetails> createState() => _DownloadedDetailsState();
}

class _DownloadedDetailsState extends State<DownloadedDetails> {
refresh(){
  // Future.delayed(Duration(milliseconds: 300),(){
  //                               context.read<ChaptersBloc>().add(ChaptersGettingEvent(id: widget.id));
  // });
}
@override
  void initState() {
    refresh();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
print("Hello");
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 2,
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
              text: widget.name,
              color: ColorManager.textColorWhite,
              weight: FontWeightManager.semibold,
              size: FontSize.s20,
              family: FontConstants.fontNunito,
            ),
          ),
          SliverToBoxAdapter(
            child: BlocBuilder<ChaptersBloc, ChaptersState>(
              builder: (context, state) {
                if(state is ChaptersLoading){
                  return Center(child: Text("Loading...."),);
                }
                if(state is ChaptersLoaded){
                  return Container(
                  child: SingleChildScrollView(
                      child: Column(
                        children: [
                          html.Html(data:  "${state.chapterModelDatabase[widget.state].c_desc}"),

                        ],
                      )),
                );
                }
                if(state is ChaptersError){
                  return Center(child: Text("Error"));
                }
                return Center(child: Text("Something went wrong"));
              },
            ),
          )
        ],
      ),
    );
  }
}
