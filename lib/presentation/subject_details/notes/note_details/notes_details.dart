// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:flutter_html/flutter_html.dart' as htm;

import 'package:studynotes/logic/notes/allNotes/bloc/allnotes_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class NotesDetails extends StatefulWidget {
  String chaptername;
  int number;
  NotesDetails({
    Key? key,
    required this.chaptername,
    required this.number,
  }) : super(key: key);

  @override
  State<NotesDetails> createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  bool show = false;
  double minZoo = 0.5;
  double maxZoom = 4;
  String intro = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AllnotesBloc, AllnotesState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is AllnotesLoading){
            return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorManager.primaryColor,
          centerTitle: true,
          title: DText(
            text: "Chapter Name",
            color: ColorManager.textColorWhite,
            weight: FontWeightManager.semibold,
            size: FontSize.s20,
            family: FontConstants.fontNunito,
          )
            ),
            const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator(),),
            )
          ]
            );
          }
         if(state is AllnotesGot){
           return CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverAppBar(
                actions: [
                  IconButton(
                      onPressed: () {
                        show == false ? show = true : show = false;
                        setState(() {});
                      },
                      icon: const Icon(Icons.settings)),
                  const SizedBox(
                    width: 12,
                  ),
                ],
                floating: true,
                centerTitle: true,
                elevation: 0,
                backgroundColor: ColorManager.primaryColor,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Chapter ${widget.number} - ${widget.chaptername}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
            state.allNotesModel.notes!=null?  SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    show = false;
                    setState(() {});
                  },
                  child: BlocConsumer<AllnotesBloc, AllnotesState>(
                      listener: (context, stat) {
                    if (stat is AllnotesGot) {
                      print("object");
                    }
                  }, builder: (context, stat) {
                    if (stat is AllnotesLoading) {
                      return const Center(
                        child: Text("Loading...."),
                      );
                    }
                    if (stat is AllnotesGot) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(left: 10, right: 10),
                        child: DoubleTappableInteractiveViewer(
                            scaleDuration: const Duration(milliseconds: 600),
                            child: Center(
                                child: HtmlWidget(
                                     "${state.allNotesModel.notes}"))
                                    ),
                      );
                    }
                    if (stat is AllnotesError) {
                      return const Text("");
                    }
                    return const Text("Something went wrong");
                  }),
                ),
              ):    SliverFillRemaining(
        hasScrollBody: false,
        child: Container(
          child: SfPdfViewer.network(
            "${ApiClass.local}uploads/images/lab/pdf/${state.allNotesModel.image}",
            pageSpacing: 0.0,
          ),
        ),
      ),
            ],
          );
         }
         return Container();
        },
      ),
    
    );
  }
}
