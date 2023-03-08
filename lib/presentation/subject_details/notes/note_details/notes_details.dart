import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:studynotes/logic/notes/allNotes/bloc/allnotes_bloc.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/resources/colors.dart';

class NotesDetails extends StatefulWidget {
  const NotesDetails({super.key});

  @override
  State<NotesDetails> createState() => _NotesDetailsState();
}

class _NotesDetailsState extends State<NotesDetails> {
  bool show = false;
  double minZoo = 0.5;
  double maxZoom = 4;
  String intro = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: [
          SliverAppBar(
                actions: [
                  IconButton(
                  onPressed: () {
                      show == false?  show=true:show=false;
                    setState(() {
                     
                    });
                  },
                  icon: const Icon(Icons.settings)),
                  const SizedBox(
                width: 12,
                  ),
                ],
                floating: true,
                centerTitle: true,
                elevation: 0,
                backgroundColor: ColorManager.primaryColor,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Center(
                  child: Text(
                    "1",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text("Chapter 1 - ${intro}",
                      style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Roboto')),
                ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: (){
                    show=false;
                    setState(() {
                      
                    });
                  },
                  onDoubleTap: (){

                  },
                  child: BlocConsumer<AllnotesBloc,AllnotesState>(
                    listener: (context,state){
                      if(state is AllnotesGot){
                       intro = state.allNotesModel.chapter!.name.toString();
                      }
                    },
                    builder: (context,state){
                    if(state is AllnotesLoading){
                      return Center(child: CircularProgressIndicator(),);
                    }
                    if(state is AllnotesGot){
                      return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: DoubleTappableInteractiveViewer(
                        scaleDuration: const Duration(milliseconds: 600),
                      child: Center(child: Html(data: state.allNotesModel.notes))),
                  );
                    }
                    if(state is AllnotesError){
                      return Text("");
                    }
                    return Text("Something went wrong");
                  })
                ),
              ),
        ],
      ),
      bottomSheet:show==true? Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: ColorManager.primaryColor
        ),
      ):Container(
        height: 5,
      ),
    );
  }
}