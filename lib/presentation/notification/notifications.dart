// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:intl/intl.dart';
import 'package:studynotes/logic/notices/bloc/notices_bloc.dart';
import 'package:studynotes/models/institute_model.dart';
import 'package:studynotes/models/notice_model.dart';

import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import 'notice_details.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
      TextEditingController _controller = TextEditingController();
  List<NoticeModel> _searchList = [];
  bool thisDay = true;
  bool thisWeek = true;
  DateTime now = DateTime.now();
  var fh =  DateFormat('H');
    final f =  DateFormat('yyyy-M-d');
    final f2 =  DateFormat('yyyy-MM-dd');
    final fyear =  DateFormat('yyyy');
    int getWeekNumber(DateTime date) {
  int year = date.year;
  int dayOfYear = date.difference(DateTime(year, 1, 1)).inDays + 1;
  int weekNumber = ((dayOfYear - date.weekday + 10) / 7).floor();
  if (weekNumber < 1) {
    weekNumber = 1;
  } else if (weekNumber > 52) {
    weekNumber = 52;
  }
  return weekNumber;
}
  bool search = false;
  refresh(){
    Future.delayed(Duration(milliseconds: 100),(){
 setState(() {
      
    });
    });
   
  }
  @override
  void initState() {
    refresh();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
         search==true?Container(): Padding(padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            onTap: (){
              search = true;
              setState(() {
                
              });
            },
            child: const Icon(Icons.search)),
          )
        ],
        centerTitle: true,
        backgroundColor: ColorManager.primaryColor,
        title:search==false? DText(color: ColorManager.textColorWhite, text: "Notifications", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s16):
        TextField(
          controller: _controller,
          onChanged: _onSearchTextChanged,
          style: const TextStyle(
            color: Colors.white,
          ),
          autofocus: true,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search for Notifications",
          labelStyle: const TextStyle(
            color: Colors.white
          ),
          hintStyle: const TextStyle(
            color: Colors.white
          ),
          prefixIcon: GestureDetector(
            onTap: (){
              search = false;
                setState(() {
                  _searchList.clear();
                });
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.close,color: Colors.white,),
            ))
        ),
        )
        ,
      ),
      body: Container(
        color: Colors.grey[100],
        // margin: EdgeInsets.only(top: 10,bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //today
              BlocBuilder<NoticesBloc,NoticesState>(builder: (context,state){
                if(state is NoticesLoading){

                }
                if(state is NoticesGot){
                  return _searchList.isNotEmpty? Column(
                    children: [
                      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color: ColorManager.textColorBlack, text: "All", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _searchList.length,
          itemBuilder: (context,index){
                       var tday = f2.format(DateTime.parse(_searchList[index].createdAt.toString()));
              return NotificationsWidget(index: index,state: state,title: _searchList[index].title.toString(), time: tday);
          })
                    ],
                  ):
                  
                  Column(
      children: [
       thisDay==false? Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color: ColorManager.textColorBlack, text: "Today", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )):Container(),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.noticeModel.length,
          itemBuilder: (context,index){
            var today = f.format(DateTime.parse(state.noticeModel[index].createdAt.toString())); 
           var mobileToday = "${now.year}-${now.month}-${now.day}"; 
           var hour =int.parse(fh.format(DateTime.parse(state.noticeModel[index].createdAt.toString())));
           var ago = now.hour-hour;
           if(today == mobileToday){
            thisDay = false;
           }
           else{thisDay = true;}
            return today==mobileToday?  NotificationsWidget(index: index,state: state,title: state.noticeModel[index].title??"", time: ago==0?"Just Now":"$ago h ago"):Container();
          })
            ]);
                }
                if(state is NoticesError){

                }
                return Text("");
              }),
          SizedBox(height: 10,),

          //this week
            BlocConsumer<NoticesBloc,NoticesState>(
              listener: (context,state){
                context.read<NoticesBloc>()..add(NoticeGetEvent());
              },
              builder: (context,state){
                if(state is NoticesLoading){

                }
                if(state is NoticesGot){
                  return _searchList.isNotEmpty?Container(): Column(
      children: [
       thisWeek==false? Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color: ColorManager.textColorBlack, text: "This Week", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )):Container(),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.noticeModel.length,
          itemBuilder: (context,index){
           var tday = f2.format(DateTime.parse(state.noticeModel[index].createdAt.toString()));
           var thisyear = int.parse(fyear.format(DateTime.parse(state.noticeModel[index].createdAt.toString())));
            var backweek = getWeekNumber(DateTime.parse(tday));
            var frontWeek = getWeekNumber(DateTime.now());
            if(thisyear==now.year){
                if(backweek == frontWeek){
            thisWeek = false;
           }
           else{thisWeek = true;}
              return backweek==frontWeek? NotificationsWidget(index: index,state: state,title: state.noticeModel[index].title.toString(), time: tday):Container();
            }
            return Container();
          })
            ]);
                }
                if(state is NoticesError){

                }
                return Text("");
              }),
            SizedBox(height: 10,),
             //all
              BlocBuilder<NoticesBloc,NoticesState>(builder: (context,state){
                if(state is NoticesLoading){

                }
                if(state is NoticesGot){
                  return _searchList.isNotEmpty?Container(): Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color: ColorManager.textColorBlack, text: "All", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.noticeModel.length,
          itemBuilder: (context,index){
                       var tday = f2.format(DateTime.parse(state.noticeModel[index].createdAt.toString()));
              return NotificationsWidget(index: index,state: state,title: state.noticeModel[index].title.toString(), time:  tday);
          })
            ]);
                }
                if(state is NoticesError){

                }
                return Text("");
              }),
            ],
          ),
        ),
      ),
    );
  }
   _onSearchTextChanged(String text)async{
        var all = context.read<NoticesBloc>().noticeController.noticeModel;
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

class NotificationsWidget extends StatelessWidget {
  int index;
  var state;
String title;
String time;
   NotificationsWidget({
    Key? key,
    required this.index,
    required this.state,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
      
                  state.noticeModel[index].description==null?  showDialog(
                      barrierDismissible: false,
                      context: context, builder: (context){
                      return Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.5,
                          width: MediaQuery.of(context).size.width*0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.1,
                                width: MediaQuery.of(context).size.width*0.9,
                                decoration: BoxDecoration(
                                  color: ColorManager.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  )
                                ),
                             child: Center(child: DText(color: ColorManager.textColorWhite, text: "Notice", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s16)),

                              ),
                              SizedBox(height: 10,),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DText(
                                      lines: 9,
                                      color: ColorManager.textColorBlack, text: state.noticeModel[index].shortDescription??"", weight: FontWeightManager.light, family: FontConstants.fontPoppins, size: FontSize.s14),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Ok"))
                            ],
                          ),
                        ),
                      );
                    }):Navigator.push(context, MaterialPageRoute(builder: (context){
                      return NoticeDetails(index: index,);
                    }));
      },
      child: Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.white,
            height: 80,
            width: double.maxFinite,
            child: Row(
              children: [
                const SizedBox(width: 10,),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                        border: Border.all(width: 3,color: Colors.white)
                      ),
                      child: const Center(
                        child: Icon(Icons.notifications,color: Colors.white,),
                      ),
                    ),
                    Positioned(
                      right: 3,
                      top: 3,
                      child: Container(
                        height: 13,
                        width: 13,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:  state.noticeModel[index].description==null? Colors.red:Colors.green,
                          border: Border.all(width: 2,color: Colors.white)
                        ),
                      )
                      )
                  ],
                ),
                const SizedBox(width: 10,),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width*0.8,
                  child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DText(
                  lines: 2,
                  color: ColorManager.textColorBlack, text: title, weight: FontWeightManager.regular, family: FontConstants.fontNoto, size: FontSize.s14),
                const SizedBox(height: 5,),
                DText(
                  lines: 1,
                  color: ColorManager.primaryColor, text: time, weight: FontWeightManager.regular, family: FontConstants.fontNunito, size: FontSize.s12),                   
              ],
            ),
                )
              ],
            )
          ),
    );
     
  }
  
}
