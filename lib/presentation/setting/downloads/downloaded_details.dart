// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:flutter_html/flutter_html.dart' as html;
import 'package:studynotes/logic/database/desc/bloc/desc_bloc.dart';

import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/subject_details/notes/functions/notes_function.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../../../resources/fonts.dart';

class DownloadedDetails extends StatefulWidget {
  var name;
  var path;
  DownloadedDetails({
    Key? key,
    required this.path,
    required this.name,
  }) : super(key: key);

  @override
  State<DownloadedDetails> createState() => _DownloadedDetailsState();
}

class _DownloadedDetailsState extends State<DownloadedDetails> {
  bool loading =true;
 Uint8List?  localpath;
readData()async{
  loading=true;
  localpath = (await SavePdf().readPDFFile(widget.path)) as Uint8List?;
  setState(() {
    loading=false;
  });
}
@override
  void initState() {
  widget.path=="/data/user/0/com.app.studynotes.bim/app_flutter/"?print("err"): readData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
print("Hello");
    return Scaffold(
      body: BlocConsumer<DescBloc, DescState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if(state is DescLoading){
            return CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: ColorManager.primaryColor,
          centerTitle: true,
          title: DText(
            text: widget.name,
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
        if(state is DescGot){
          return   CustomScrollView(
              physics: const ClampingScrollPhysics(),
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
               state.desc[0].c_desc.isNotEmpty? SliverToBoxAdapter(
                  child: BlocBuilder<DescBloc, DescState>(
                    builder: (context, state) {
                      if(state is DescLoading){
                        return const Center(child: Text("Loading..."),);
                      }
                      if(state is DescGot){
                        return Container(
                        child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  HtmlWidget(state.desc[0].c_desc),
                                  
                                ],
                              ),
                            )),
                      );
                      }
                      if(state is DescError){
                        return Center(child: Text(state.message));
                      }
                      return const Center(child: Text("Something went wrong"));
                    },
                  ),
                ):
                 SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                child: loading==true?const CircularProgressIndicator(): SfPdfViewer.memory(
                  localpath!,
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
