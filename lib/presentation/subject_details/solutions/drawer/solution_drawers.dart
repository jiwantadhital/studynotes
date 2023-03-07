import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/notes/qyear/bloc/qyear_bloc.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../../home_pages/widgets/home_page_widgets.dart';

class SolutionDrawer extends StatelessWidget {
  const SolutionDrawer({super.key});

   @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10,right: 10,top: 40),
              height: 100,
              width: 200,
              decoration: BoxDecoration(
              ),
              child: Center(
                child: DText(color: ColorManager.textColorWhite, text: "Select The Year", weight: FontWeightManager.bold, family: FontConstants.fontNoto, size: FontSize.s14),
              ),
            ),
            SizedBox(height: 10,),
            Divider(
              height: 4,
              color: Colors.white,
            ),
            Expanded(
              child: BlocBuilder<QyearBloc,QyearState>(builder: (context,state){
                if(state is QyearLoading){
                  
                }
                if(state is QyearGot){
                  return ListView.builder(
                shrinkWrap: true,
                itemCount: state.qyearModel.length,
                itemBuilder: (context,index){
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 50,
                        width: 200,
                        child: DText(color: ColorManager.textColorWhite, text: state.qyearModel[index].name??"", weight: FontWeightManager.semibold, family: FontConstants.fontNunito, size: FontSize.s13),
                      ),
                      Divider(
              height: 2,
              color: Colors.white,
            ),
                    ],
                  );
              });
                }
                if(state is QyearError){

                }
                return Container();
              })
            )
          ],
        );
  }
}