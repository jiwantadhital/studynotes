import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:studynotes/logic/notices/bloc/notices_bloc.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/fonts.dart' as font;

import '../../resources/colors.dart';

class NoticeDetails extends StatefulWidget {
  int index;
   NoticeDetails({super.key,required this.index});

  @override
  State<NoticeDetails> createState() => _NoticeDetailsState();
}

class _NoticeDetailsState extends State<NoticeDetails> {
  @override
  Widget build(BuildContext context) {
       final notice = context.read<NoticesBloc>().noticeController.noticeModel[widget.index];

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: DText(color: ColorManager.textColorWhite, text: "New Notice", weight: font.FontWeightManager.bold, family: font.FontConstants.fontNunito, size: font.FontSize.s16),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Html(data: notice.description),
        ),
      ),
    );
  }
}