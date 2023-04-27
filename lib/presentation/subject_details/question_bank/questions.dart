import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/questions/bloc/question_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/subject_details/question_bank/drawer/drawer_items.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

class Questions extends StatefulWidget {
  int sub_id;
   Questions({super.key, required this.sub_id});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  String _selectedValue = '2017';

  void _onDrawerItemPressed(String value) {
    setState(() {
      _selectedValue = value;
    });
    Navigator.pop(context); // Close the drawer
  }
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        backgroundColor: ColorManager.primaryColor,
        width: 200,
        child: DrawerItems(sub_id: widget.sub_id,onItemSelected: _onDrawerItemPressed,)
      ),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back)),
        actions: [
          Padding(padding: 
          const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: (){
            if(scaffoldKey.currentState!.isDrawerOpen){
              scaffoldKey.currentState!.closeDrawer();
            }
            else{
              scaffoldKey.currentState!.openDrawer();
            }
      setState(() {
        
      });
            },
            child: const Icon(Icons.menu,)),
          )
        ],
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(color: ColorManager.textColorWhite, text: "Question - $_selectedValue", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
          scaleDuration: const Duration(milliseconds: 600),
        child: BlocBuilder<QuestionBloc,QuestionState>(builder: (context,state){
          if(state is QuestionLoading){
            return const Center(child: CircularProgressIndicator());
          }
          if(state is QuestionGot){
            return ListView.builder(
          itemCount: state.questionModel.length,
          itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 10),
              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                  "${ApiClass.local}uploads/images/questionBank/${state.questionModel[index].image}"
                ),
                fit: BoxFit.contain
                )
              ),
            );
        });
          }
          if(state is QuestionError){
            return const Center(child: Text("error"));
          }
          return const Text("Something went wrong");
        })
      ),
    );
  }
}