import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';
import 'package:studynotes/presentation/setting/downloads/downloaded_subjects.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class Downloaded extends StatefulWidget {
  const Downloaded({super.key});

  @override
  State<Downloaded> createState() => _DownloadedState();
}

class _DownloadedState extends State<Downloaded> {
  @override
  void initState() {
     context.read<ChaptersBloc>().add(ChaptersSubjectEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     context.read<ChaptersBloc>().add(ChaptersSubjectEvent());
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
    // Status bar color
    statusBarColor: ColorManager.primaryColor, 

    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.light, 
    statusBarBrightness: Brightness.light,   ),
  backgroundColor: ColorManager.primaryColor,
        title: DText(text: "Downloads",color: ColorManager.textColorWhite,weight: FontWeightManager.semibold,size: FontSize.s20, family: FontConstants.fontNunito,),
      ),
      body: BlocBuilder<ChaptersBloc,ChaptersState>(builder: (context,state){
        if(state is ChaptersLoading){
          return const Center(child: CircularProgressIndicator(),);
        }
        if(state is SubjectChapterLoaded){
          return state.subjectModelDatabase.isEmpty?Center(child: Column(
            children: [
              Image.asset("assets/images/not.png"),
              const SizedBox(height: 10,),
              DText(color: ColorManager.textColorBlack, text: "You've downloaded nothing",
                               weight: FontWeightManager.regular, family: FontConstants.fontPoppins, size: FontSize.s14)
            ],
          )): GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/1,
          crossAxisSpacing: 10
          ),
        itemCount: state.subjectModelDatabase.length,
        itemBuilder: (context,index){
        return GestureDetector(
          onTap: (){
            Navigator.push(context, 
                             MaterialPageRoute(builder: (context){
                               return DownloadedChapters(id: state.subjectModelDatabase[index].s_id,);
                           })
                                ).then((value) {
                                  setState(() {
                                    
                                  });
                                });
          },
          child: Container(
          padding: const EdgeInsets.only(left: 10,right: 10),
          margin: const EdgeInsets.only(top: 10,bottom: 5),
          height: 115,
          width: MediaQuery.of(context).size.width*0.4,
          color: Colors.white,
          child: Row(
            children: [
              Container(
                height: 110,
                width: MediaQuery.of(context).size.width*0.38,
                // color: Colors.yellow,
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 5),
                      child: DText(lines: 2,text: state.subjectModelDatabase[index].subject,color: ColorManager.textColorBlack,weight: FontWeightManager.semibold,size: FontSize.s13, family: FontConstants.fontPoppins,),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 5,left: 5),
                      child: DText(lines: 1,text: state.subjectModelDatabase[index].semester.toString(),color: ColorManager.textColorBlack,weight: FontWeightManager.regular,size: FontSize.s11, family: FontConstants.fontPoppins,),
                    )
                  ],
                ),
              ),
             
            ],
          ),
              ),
        );
      });
        }
        if(state is ChaptersError){
          return const Center(child: Text("Something went wrong"));
        }
        return const Center(child: Text("Empty"));
      }),
    );
  }
}