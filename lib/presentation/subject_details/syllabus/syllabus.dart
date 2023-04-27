import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/notes/syllabus/bloc/syllabus_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class Syllabus extends StatefulWidget {
  const Syllabus({super.key});

  @override
  State<Syllabus> createState() => _SyllabusState();
}

class _SyllabusState extends State<Syllabus> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(color: ColorManager.textColorWhite, text: "Syllabus - Basic Math", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
          scaleDuration: const Duration(milliseconds: 600),

        child: BlocBuilder<SyllabusBloc,SyllabusState>(builder: (context,state){
          if(state is SyllabusLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is SyllabusGot){
            return ListView.builder(
          itemCount: state.syllabusModel.length,
          itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 10),
              height: MediaQuery.of(context).size.height*0.85,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                 "${ApiClass.local}uploads/images/syllabus/${state.syllabusModel[index].image}"
                ),
                fit: BoxFit.contain
                )
              ),
            );
        });
          }
          if(state is SyllabusError){
            return const Center(child: Text("Error"));
          }
          return const Text("something went wrong");
        })
      ),
    );
  }
}

