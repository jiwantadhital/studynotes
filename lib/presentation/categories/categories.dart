import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/notes/semesters/bloc/semesters_bloc.dart';
import 'package:studynotes/logic/notes/subjects/bloc/subjects_bloc.dart';
import 'package:studynotes/models/subject_model.dart';
import 'package:studynotes/presentation/categories/bottomsheet/bottom.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
    List<String> continueReading = UserSimplePreferences.getContinue()??[];

  List<SubjectModel> subject = [];
  final spinkit = SpinKitThreeBounce(
    color: ColorManager.primaryColor,
    size: 20,
);
  int semester = 1;
  int selected = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              BlocBuilder<SemestersBloc,SemestersState>(builder: (context,state){
                if(state is SemesterLoading){
                 return LoadError(size: size, selected: selected);
                }
                if(state is SemesterGot){
                  return Container(
                height: 50,
                width: size.width,
                child: ListView.builder(
                  itemCount: state.semesterModel.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                  return GestureDetector(
                    onTap: (){
                     
                      setState(() {
                         selected = index;
                      context.read<SubjectsBloc>()..add(SubjectGettingEvent(id: state.semesterModel[index].id!.toInt()));
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10,bottom: 5,right: 7,left: 7),
                      height: 25,
                      width: 100,
                      decoration: BoxDecoration(
                        color: selected==index?Theme.of(context).buttonColor: Theme.of(context).hoverColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 2,color: Colors.white),
                      ),
                      child: Center(
                        child: DText(color: ColorManager.textColorWhite, text: state.semesterModel[index].name??"", weight: FontWeightManager.semibold, family: FontConstants.fontPoppins, size: FontSize.s16),
                      ),
                    ),
                  );
                }),
              );
                }
                if(state is SemesterError){
                  return LoadError(size: size, selected: selected);
                }
                return Container();
              }),
              SizedBox(height: 10,),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: MediaQuery.of(context).size.height,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                  color: UserSimplePreferences.getDark()==true?Colors.black:Colors.white,
                     borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)
                        )
                  ),
                  child: Column(
                    children: [
                      DText(color: ColorManager.textColorBlack,
                      text: "Subjects",
                      weight: FontWeightManager.semibold, family: FontConstants.fontPoppins, size: FontSize.s16),
                      SizedBox(height: 10,),
                      BlocBuilder<SubjectsBloc,SubjectsState>(builder: (context,state){
                        if(state is SubjectLoading){
                          return Container(
                            margin: EdgeInsets.only(top: 40),
                            child: spinkit);
                        }
                        if(state is SubjectGot){
                          return Expanded(
                            child: GridView.builder(
                                                  shrinkWrap: true,
                                                  physics: BouncingScrollPhysics(),
                                                  itemCount: state.subjectModel.length,
                                                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                 crossAxisCount: 3,  
                                                 crossAxisSpacing: 7.0,  
                                                 childAspectRatio: 2/2.1,
                                                 mainAxisSpacing: 10.0
                                                ),
                                                 itemBuilder: (context,index){
                          
                                                  return GestureDetector(
                            onTap: (){
                                    if(continueReading.length>4){
                         continueReading.contains(state.subjectModel[index].id.toString())?print("j"): continueReading.remove(continueReading.first);
                        }
                      continueReading.add(state.subjectModel[index].id.toString());
                        continueReading = continueReading.toSet().toList();
                        UserSimplePreferences.setContinue(continueReading);
                        print(UserSimplePreferences.getContinue());
                              showModalBottomSheet(
                                isScrollControlled: true,
                                context: context,
                               builder: (BuildContext context) {
                                return BottomOfCategories(sub_id: state.subjectModel[index].id!.toInt(),subject: state.subjectModel[index].title??"",);
                              }).whenComplete(() {
                                setState(() {
                                  
                                });
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              //width: 200,
                              decoration: BoxDecoration(
                                color: Theme.of(context).buttonColor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10),
                                    height: 60,
                                    child: DText(color: ColorManager.textColorWhite, text: state.subjectModel[index].title.toString(), weight: FontWeightManager.medium, family: FontConstants.fontPoppins, size: FontSize.s13),
                                  ),
                                  Container(
                                    height: 30,
                                    child: DText(color: ColorManager.textColorWhite, text: "Chapters: 12", weight: FontWeightManager.light, family: FontConstants.fontPoppins, size: FontSize.s12),
                                  )
                                ],
                              ),
                            ),
                                                  );
                                                  }
                                  
                                                ),
                          );
                        }
                        if(state is SubjectError){
                         return Container(
                          margin: EdgeInsets.only(top: 40),
                          height: 250,
                          width: 200,
                          child: Column(
                            children: [
                              Image.asset("assets/images/wrong.png"),
                              SizedBox(height: 10,),
                              DText(color: ColorManager.textColorBlack, text: "Something went wrong",
                               weight: FontWeightManager.regular, family: FontConstants.fontPoppins, size: FontSize.s14)
                            ],
                          ));
                        }
                        return Container();
                      })  ,
                      SizedBox(height: 80,)

                    ],
                  ),
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LoadError extends StatelessWidget {
   LoadError({
    super.key,
    required this.size,
    required this.selected,
  });
 final spinkit = SpinKitPulse(
    color: Colors.white,
    size: 20,
);
  final Size size;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return Container(
                height: 50,
                width: size.width,
                child: ListView.builder(
     itemCount: 5,
     scrollDirection: Axis.horizontal,
     itemBuilder: (context,index){
     return Container(
       margin: EdgeInsets.only(top: 10,bottom: 5,right: 7,left: 7),
       height: 25,
       width: 100,
       decoration: BoxDecoration(
         color: selected==index?Theme.of(context).buttonColor: Theme.of(context).hoverColor,
         borderRadius: BorderRadius.circular(20),
         border: Border.all(width: 2,color: Colors.white),
       ),
       child: Center(child: spinkit,),
     );
                }),
              );
  }
}
