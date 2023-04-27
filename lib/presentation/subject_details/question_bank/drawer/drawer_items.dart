import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/notes/qyear/bloc/qyear_bloc.dart';
import 'package:studynotes/logic/questions/bloc/question_bloc.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../../home_pages/widgets/home_page_widgets.dart';

class DrawerItems extends StatelessWidget {
  final ValueChanged<String> onItemSelected;
  int sub_id;
   DrawerItems({super.key, required this.sub_id, required this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    return  Column(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 40),
              height: 100,
              width: 200,
              decoration: const BoxDecoration(
              ),
              child: Center(
                child: DText(color: ColorManager.textColorWhite, text: "Select The Year", weight: FontWeightManager.bold, family: FontConstants.fontNoto, size: FontSize.s14),
              ),
            ),
            const SizedBox(height: 10,),
            const Divider(
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
                      GestureDetector(
                        onTap: (){
                          onItemSelected(state.qyearModel[index].name??"");
                          context.read<QuestionBloc>().add(QuestionGettingEvent(id: sub_id, year_id: state.qyearModel[index].id!.toInt()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          height: 50,
                          width: 200,
                          child: DText(color: ColorManager.textColorWhite, text: state.qyearModel[index].name??"", weight: FontWeightManager.semibold, family: FontConstants.fontNunito, size: FontSize.s13),
                        ),
                      ),
                      const Divider(
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