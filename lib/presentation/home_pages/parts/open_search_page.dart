import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/allsubjects/bloc/allsubject_bloc.dart';
import 'package:studynotes/logic/notes/chapters/bloc/chapter_bloc.dart';
import 'package:studynotes/models/all_subjects_model.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/setting/downloads/downloaded_details.dart';
import 'package:studynotes/presentation/subject_details/notes/notes.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class OpenSearchPage extends StatefulWidget {
  const OpenSearchPage({super.key});

  @override
  State<OpenSearchPage> createState() => _OpenSearchPageState();
}

class _OpenSearchPageState extends State<OpenSearchPage> {
  TextEditingController _controller = TextEditingController();
  List<AllSubjectModel> _searchList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: Colors.grey.withOpacity(0.5), 
    statusBarIconBrightness: Brightness.light, 
    statusBarBrightness: Brightness.light, 
  ),
        actions: [
          Padding(padding: EdgeInsets.only(top: 15,bottom: 15,right: 20),
          child: Icon(Icons.menu)
          )
        ],
        toolbarHeight: 70,
        foregroundColor: Colors.black.withOpacity(0.8),
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.6),
        title: TextField(
          onChanged: _onSearchTextChanged,
          controller: _controller,
          autofocus: true,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Search all subjects"
          ),
        ),
      ),
      body: Container(
        child: _searchList.isEmpty?Container(): ListView.builder(
              itemCount: _searchList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                     context.read<ChapterBloc>()..add(ChapterGettingEvent(id: _searchList[index].id!.toInt()));
                        Navigator.push(context,
                                 MaterialPageRoute(builder: (context){
                               return Notes(id: _searchList[index].id!.toInt(),);
                                 })
                  );
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    margin: EdgeInsets.only(top: 5, bottom: 5),
                    height: 80,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: ColorManager.primaryColor,
                              border: Border.all(
                                  width: 3,
                                  color: Color.fromARGB(255, 219, 218, 218))),
                          child: Center(
                            child: DText(
                              text: _searchList[index].id.toString(),
                              color: ColorManager.textColorWhite,
                              weight: FontWeightManager.semibold,
                              size: FontSize.s20,
                              family: FontConstants.fontNunito,
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width * 0.7,
                          // color: Colors.yellow,
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 5),
                                child: DText(
                                  lines: 2,
                                  text:
                                    _searchList[index].title.toString(),
                                  color: ColorManager.textColorBlack,
                                  weight: FontWeightManager.semibold,
                                  size: FontSize.s15,
                                  family: FontConstants.fontPoppins,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10, left: 5),
                                child: DText(
                                  lines: 1,
                                  text: _searchList[index].semester!.name.toString(),
                                  color: ColorManager.textColorBlack,
                                  weight: FontWeightManager.regular,
                                  size: FontSize.s12,
                                  family: FontConstants.fontPoppins,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
      ),
    );
  }
      _onSearchTextChanged(String text)async{
        var all = context.read<AllsubjectBloc>().notesController.allSubjectmodel;
      // var all = Provider.of<NovelController>(context,listen: false).novelList;
      _searchList.clear();
      if(text.isEmpty){
        setState(() {
        });
        return;
      }
      all.forEach((searchDetails) {
        if(searchDetails.title!.toLowerCase().contains(text.toLowerCase())){
          _searchList.add(searchDetails);
          _searchList.sort((a, b) {
            return a.title.toString().compareTo(b.title.toString());
          },);
        }
       });
       setState(() {
         
       });
    }
}