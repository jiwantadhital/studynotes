// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart' as html;

import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';

import '../../../resources/fonts.dart';

class DownloadedDetails extends StatefulWidget {
  var data;
  var name;
   DownloadedDetails({
    Key? key,
    required this.data,
    required this.name,
  }) : super(key: key);

  @override
  State<DownloadedDetails> createState() => _DownloadedDetailsState();
}

class _DownloadedDetailsState extends State<DownloadedDetails> {
  @override
  Widget build(BuildContext context) {
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
    statusBarBrightness: Brightness.light,   ),
  backgroundColor: ColorManager.primaryColor,
        title: DText(text: widget.name,color: ColorManager.textColorWhite,weight: FontWeightManager.semibold,size: FontSize.s20, family: FontConstants.fontNunito,),
      ),
      SliverToBoxAdapter(
        child: Container(
        child: SingleChildScrollView(child: html.Html(data: widget.data)),
      ),
      )
      ],
     ),
    );
  }
}