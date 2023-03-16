import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/notes/lab/bloc/lab_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class Labs extends StatefulWidget {
  const Labs({super.key});

  @override
  State<Labs> createState() => _LabsState();
}

class _LabsState extends State<Labs> {
  String subject = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(
            color: ColorManager.textColorWhite,
            text: "Labs - $subject",
            weight: FontWeightManager.bold,
            family: FontConstants.fontNunito,
            size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
        scaleDuration: const Duration(milliseconds: 600),
        child: BlocConsumer<LabBloc, LabState>(
          listener:(context, state) {
            if(state is LabGot){
              subject = state.labModel.isNotEmpty?state.labModel[state.labModel.length-1].subject!.title.toString():"";
              setState(() {
                
              });
            }
          },
          builder: (context, state) {
           if(state is LabLoading){
            return Center(child: CircularProgressIndicator(),);
           }
           if(state is LabError){
            return Center(child: Text("Something went wrong"),);
           }
           if(state is LabGot){
             return ListView.builder(
                itemCount: state.labModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
                    height: MediaQuery.of(context).size.height * 0.85,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://10.3.6.13:8000/uploads/images/lab/${state.labModel[index].image}"),
                            fit: BoxFit.contain)),
                  );
                });
           }
           return Container();
          },
        ),
      ),
    );
  }
}
