import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
// import 'package:flutter_html/flutter_html.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/fonts.dart' as font;

import '../../resources/colors.dart';

class NoticeDetails extends StatefulWidget {
  String datas;
   NoticeDetails({super.key,required this.datas});

  @override
  State<NoticeDetails> createState() => _NoticeDetailsState();
}

class _NoticeDetailsState extends State<NoticeDetails> {

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: UserSimplePreferences.getDark()==true?Colors.black:Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: DText(color: ColorManager.textColorWhite, text: "New Notice", weight: font.FontWeightManager.bold, family: font.FontConstants.fontNunito, size: font.FontSize.s16),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: HtmlWidget(widget.datas,
    
          ),
        ),
      ),
    );
  }
}