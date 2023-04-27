import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/institute/comments/bloc/comments_bloc.dart';
import 'package:studynotes/logic/institute/images/bloc/image_bloc.dart';
import 'package:studynotes/logic/institute/main/bloc/institute_bloc.dart';
import 'package:studynotes/logic/notes/subjects/bloc/subjects_bloc.dart';
import 'package:studynotes/models/institute_model.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/presentation/colleges/college_details/college_details.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

class Colleges extends StatefulWidget {
  const Colleges({super.key});

  @override
  State<Colleges> createState() => _CollegesState();
}

class _CollegesState extends State<Colleges> {
    final TextEditingController _controller = TextEditingController();
  final List<InstituteModel> _searchList = [];

  bool search = false;
  @override
  Widget build(BuildContext context) {
        context.read<SubjectsBloc>().add(SubjectGettingEvent(id: 1));

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
              child: const Icon(Icons.search)):Container(),
          )
        ],
        centerTitle: true,
        // backgroundColor: ColorManager.primaryColor,
        title: search==false? DText(color: ColorManager.textColorWhite, text: "Institutes", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s16):
        TextField(
          controller: _controller,
          onChanged: _onSearchTextChanged,
          onTap: (){
           BottomBarPage.setLocale(context,true);
setState(() {
  
});
          },
          onEditingComplete: (){
            BottomBarPage.setLocale(context,false);
            FocusScope.of(context).requestFocus(FocusNode());
            setState(() {
              
            });
          },
          style: const TextStyle(
            color: Colors.white,
          ),
          autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search for institutes",
          labelStyle: const TextStyle(
            color: Colors.white
          ),
          hintStyle: const TextStyle(
            color: Colors.white
          ),
          prefixIcon: GestureDetector(
            onTap: (){
              search = false;
               BottomBarPage.setLocale(context,false);
                setState(() {
                  _searchList.clear();
                });
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 30),
              child: Icon(Icons.close,color: Colors.white,),
            ))
        ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            BlocBuilder<InstituteBloc,InstituteState>(builder: (context,state){
              if(state is InstituteLoading){
                return const Center(child: CircularProgressIndicator(),);
              }
              if(state is InstituteError){
                return const Center(child: Text("Error"),);
              }
              if(state is InstituteLoaded){
                return _searchList.isNotEmpty? GridView.builder(
              shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.66,
                ), 
                itemCount: _searchList.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.only(left: 10,right: 10,top: 15),
                      
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: ()async{
                              context.read<ImageBloc>().add(ImageGettingEvent(id: _searchList[index].id!.toInt()));
                              context.read<CommentsBloc>().add(CommentsGettingEvent(id: _searchList[index].id!.toInt()));
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CollegeDetail(index: index,id:_searchList[index].id!.toInt());
                      }));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                                          height: 100,
                                          width: 120,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 2,color: Colors.grey.withOpacity(0.5)),
       
                                          ),
                                          child: Image.network("${ApiClass.local}uploads/images/colleges/${_searchList[index].logo}",fit: BoxFit.cover,),
                                        ),
                          ),
                      const SizedBox(height: 5,),
                      Container(
                        padding: const EdgeInsets.only(left: 5,right: 5),
                        child:  DText(
                          lines: 3,
                          color: ColorManager.textColorBlack, text: _searchList[index].name.toString(), weight: FontWeightManager.regular, family: FontConstants.fontNunito, size: FontSize.s12),
                        
                      ),
                        ],
                      )
                    ),
                  );
                }
                      ):GridView.builder(
              shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
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
                            onTap: ()async{
                              context.read<ImageBloc>().add(ImageGettingEvent(id: state.instituteModel[index].id!.toInt()));
                              context.read<CommentsBloc>().add(CommentsGettingEvent(id: state.instituteModel[index].id!.toInt()));
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                        return CollegeDetail(index: index,id:state.instituteModel[index].id!.toInt());
                      }));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                                          height: 100,
                                          width: 120,
                                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(width: 2,color: Colors.grey.withOpacity(0.5)),
       
                                          ),
                                          child: Image.network("${ApiClass.local}uploads/images/colleges/${state.instituteModel[index].logo}",fit: BoxFit.cover,),
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
              return const Center(child: Text("Something went wrong"),);
            }),
                      const SizedBox(height: 35,)
          ],
        ),
      ),
    );
  }
  _onSearchTextChanged(String text)async{
        var all = context.read<InstituteBloc>().instituteController.instituteModel;
      // var all = Provider.of<NovelController>(context,listen: false).novelList;
      _searchList.clear();
      if(text.isEmpty){
        setState(() {
        });
        return;
      }
      for (var searchDetails in all) {
        if(searchDetails.name!.toLowerCase().contains(text.toLowerCase())){
          _searchList.add(searchDetails);
          _searchList.sort((a, b) {
            return a.name.toString().compareTo(b.name.toString());
          },);
        }
       }
       setState(() {
         
       });
    }
}
