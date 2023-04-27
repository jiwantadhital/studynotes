import 'package:flutter/material.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/subject_details/extra_notes/extra_drawer/extra_drawer.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class ExtraNotes extends StatefulWidget {
  const ExtraNotes({super.key});

  @override
  State<ExtraNotes> createState() => _ExtraNotesState();
}

class _ExtraNotesState extends State<ExtraNotes> {
  final scaffoldKey3 = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey3,
      drawer: Drawer(
        backgroundColor: ColorManager.primaryColor,
        width: 200,
        child: const ExtraDrawer()
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
            if(scaffoldKey3.currentState!.isDrawerOpen){
              scaffoldKey3.currentState!.closeDrawer();
            }
            else{
              scaffoldKey3.currentState!.openDrawer();
            }
      setState(() {
        
      });
            },
            child: const Icon(Icons.menu,)),
          )
        ],
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title: DText(color: ColorManager.textColorWhite, text: "Extra Notes", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s15),
      ),
      body: DoubleTappableInteractiveViewer(
          scaleDuration: const Duration(milliseconds: 600),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
            return Container(
              margin: const EdgeInsets.only(left: 5,right: 5,top: 5,bottom: 10),
              height: MediaQuery.of(context).size.height*0.9,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(image: NetworkImage(
                  "https://html.scribdassets.com/1las21nxmo8rt97u/images/1-534c22921c.jpg"
                ),
                fit: BoxFit.contain
                )
              ),
            );
        }),
      ),
    );
  }
}