import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/institute/comments/bloc/comments_bloc.dart';
import 'package:studynotes/logic/institute/images/bloc/image_bloc.dart';
import 'package:studynotes/logic/institute/main/bloc/institute_bloc.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/presentation/colleges/college_details/college_details.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class Colleges extends StatefulWidget {
  const Colleges({super.key});

  @override
  State<Colleges> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
  bool search = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child:search==false? GestureDetector(
              onTap: (){
                search = true;
                 setState(() {
                 
               });
                BottomBarPage.setLocale(context,true);
              
              },
              child: Icon(Icons.search)):Container(),
          )
        ],
        centerTitle: true,
        // backgroundColor: ColorManager.primaryColor,
        title: search==false? DText(color: ColorManager.textColorWhite, text: "Institutes", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s16):
        TextField(
          onTap: (){
           BottomBarPage.setLocale(context,true);
setState(() {
  
});
          },
          onEditingComplete: (){
            BottomBarPage.setLocale(context,false);
            FocusScope.of(context).requestFocus(new FocusNode());
            setState(() {
              
            });
          },
          style: TextStyle(
            color: Colors.white,
          ),
          autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search for institutes",
          labelStyle: TextStyle(
            color: Colors.white
          ),
          hintStyle: TextStyle(
            color: Colors.white
          ),
          prefixIcon: GestureDetector(
            onTap: (){
              search = false;
               BottomBarPage.setLocale(context,false);
                setState(() {
                  
                });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Icon(Icons.close,color: Colors.white,),
            ))
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            BlocBuilder<InstituteBloc,InstituteState>(builder: (context,state){
              if(state is InstituteLoading){
                return Center(child: CircularProgressIndicator(),);
              }
              if(state is InstituteError){
                return Center(child: Text("Error"),);
              }
              if(state is InstituteLoaded){
                return GridView.builder(
              shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.66,
                ), 
                itemCount: state.instituteModel.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10,right: 10,top: 15),
                      
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              context.read<ImageBloc>()..add(ImageGettingEvent(id: state.instituteModel[index].id!.toInt()));
                              context.read<CommentsBloc>()..add(CommentsGettingEvent(id: state.instituteModel[index].id!.toInt()));
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CollegeDetail(index: index,);
                      }));
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                                          height: 100,
                                          width: 120,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 2,color: Colors.grey.withOpacity(0.5)),
       
                                          ),
                                          child: Image.asset("assets/images/clz.png",fit: BoxFit.cover,),
                                        ),
                          ),
                      const SizedBox(height: 5,),
                      Container(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child:  DText(
                          lines: 3,
                          color: ColorManager.textColorBlack, text: state.instituteModel[index].name.toString(), weight: FontWeightManager.regular, family: FontConstants.fontNunito, size: FontSize.s12),
                        
                      ),
                        ],
                      )
                    ),
                  );
                }
                      );
              }
              return Center(child: Text("Something went wrong"),);
            }),
                      SizedBox(height: 35,)
          ],
        ),
      ),
    );
  }
}