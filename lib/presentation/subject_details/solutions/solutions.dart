import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/notes/subjects/bloc/subjects_bloc.dart';
import 'package:studynotes/logic/solution/bloc/solutions_bloc.dart';
import 'package:studynotes/models/syllabus_model.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/subject_details/solutions/drawer/solution_drawers.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class Solutions extends StatefulWidget {
  int sub_id;
   Solutions({super.key, required this.sub_id});

  @override
  State<Solutions> createState() => _SolutionsState();
}

class _SolutionsState extends State<Solutions> {
  final scaffoldKey1 = GlobalKey<ScaffoldState>();
String _selectedValue = '2017';

  void _onDrawerItemPressed(String value) {
    setState(() {
      _selectedValue = value;
    });
    Navigator.pop(context); // Close the drawer
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey1,
      drawer: Drawer(
          backgroundColor: ColorManager.primaryColor,
          width: 200,
          child: SolutionDrawer(sub_id: widget.sub_id,onItemSelected: _onDrawerItemPressed,)),
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
                onTap: () {
                  if (scaffoldKey1.currentState!.isDrawerOpen) {
                    scaffoldKey1.currentState!.closeDrawer();
                  } else {
                    scaffoldKey1.currentState!.openDrawer();
                  }
                  setState(() {});
                },
                child: Icon(
                  Icons.menu,
                )),
          )
        ],
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(
            color: ColorManager.textColorWhite,
            text: "Solution - ${_selectedValue}",
            weight: FontWeightManager.bold,
            family: FontConstants.fontNunito,
            size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
        scaleDuration: const Duration(milliseconds: 600),
        child: BlocBuilder<SolutionsBloc, SolutionsState>(
          builder: (context, state) {
           if(state is SolutionsLoading){
            return Center(child: CircularProgressIndicator(),);
           }
           if(state is SolutionsError){
            return Center(child: Text(state.message),);
           }
           if(state is SolutionsGot){
             return ListView.builder(
                itemCount: state.solutionModel.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 10),
                    height: MediaQuery.of(context).size.height * 0.9,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${ApiClass.mainApi}uploads/images/solution/${state.solutionModel[index].image}"),
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
