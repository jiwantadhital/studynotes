// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/notices/bloc/notices_bloc.dart';
import 'package:studynotes/logic/thisWeek/bloc/t_week_bloc.dart';
import 'package:studynotes/logic/todayNotice/bloc/t_notice_bloc.dart';
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
  
      final TextEditingController _controller = TextEditingController();
  final List<NoticeModel> _searchList = [];
  DateTime now = DateTime.now();
  var fh =  DateFormat('H');
    final f =  DateFormat('yyyy-M-d');
    final f2 =  DateFormat('yyyy-MM-dd');

  bool search = false;
  
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    UserSimplePreferences.setNotices(context.read<NoticesBloc>().noticeController.total);
    print("Notices ${UserSimplePreferences.getNotices()}");
    return Scaffold(
      appBar: AppBar(
 
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
        color: UserSimplePreferences.getDark()==true?Colors.black87:Colors.grey[100],
        // margin: EdgeInsets.only(top: 10,bottom: 10),
        child: SingleChildScrollView(
          controller: context.read<NoticesBloc>().scrollController,
          child:_searchList.isNotEmpty? Column(
                    children: [
                      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color: UserSimplePreferences.getDark()==true?ColorManager.textColorWhite:ColorManager.textColorBlack, text: "All", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: _searchList.length,
          itemBuilder: (context,index){
                       var tday = f2.format(DateTime.parse(_searchList[index].createdAt.toString()));
              return NotificationsSearch(index: index,list: _searchList,title: _searchList[index].title.toString(), time: tday);
          })
                    ],
                  ): Column(
            children: [
              //today
              BlocBuilder<TNoticeBloc,TNoticeState>(
                builder: (context,stat){
                
                if(stat is TNoticeLoading){

                }
                if(stat is TNoticeLoaded){
                  return 
                  
                  Column(
      children: [
     stat.noticeModel.isEmpty?Container():    Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color: UserSimplePreferences.getDark()==true?ColorManager.textColorWhite:ColorManager.textColorBlack, text: "Today", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: stat.noticeModel.length,
          itemBuilder: (context,index){
         return NotificationsWidget(index: index,state: stat,title: stat.noticeModel[index].title??"", time: "Today");
          })
            ]);
                }
                if(stat is TNoticeError){

                }
                return const Text("No");
              }),
          const SizedBox(height: 10,),

          //this week
            BlocBuilder<TWeekBloc,TWeekState>(
              builder: (context,sta){
                if(sta is TWeekLoading){

                }
                if(sta is TWeekLoaded){
                  return Column(
      children: [
      sta.noticeModel.isEmpty?Container():  Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color:UserSimplePreferences.getDark()==true?ColorManager.textColorWhite:ColorManager.textColorBlack, text: "This Week", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: sta.noticeModel.length,
          itemBuilder: (context,index){
           var tday = f2.format(DateTime.parse(sta.noticeModel[index].createdAt.toString()));
              return  NotificationsWidget(index: index,state: sta,title: sta.noticeModel[index].title.toString(), time: tday);
    
          })
            ]);
                }
                if(sta is TWeekError){

                }
                return const Text("");
              }),
            const SizedBox(height: 10,),
             //all
              BlocConsumer<NoticesBloc,NoticesState>(
                listener:(context, state) {
                  if(state is NoticesLoading){
                    // ScaffoldMessenger.of(context).showSnackBar(ShowSnackBar().snack("Loading..", ColorManager.primaryColor));
                  }
                },
                builder: (context,state){
                if(state is NoticesLoading){
                  // return Center(child: CircularProgressIndicator());
                }
                if(state is NoticesGot){
                  return  Column(
      children: [
       Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color: UserSimplePreferences.getDark()==true?ColorManager.textColorWhite:ColorManager.textColorBlack, text: "All", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:context.read<NoticesBloc>().isLoadingMore? state.noticeModel.length+1:state.noticeModel.length,
          itemBuilder: (context,index){
                   if(index >= state.noticeModel.length){
                    print("index = $index length = ${state.noticeModel.length}");
                    return const Center(child: CircularProgressIndicator());
                   }
                   else{
                     var tday = f2.format(DateTime.parse(state.noticeModel[index].createdAt.toString()));
              return NotificationsWidget(index: index
              ,state: state,title: state.noticeModel[index].title.toString(), time:  tday);
                   }
          })
            ]);
                }
                if(state is NoticesError){

                }
                return const Text("");
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
      for (var searchDetails in all) {
        if(searchDetails.title!.toLowerCase().contains(text.toLowerCase())){
          _searchList.add(searchDetails);
          _searchList.sort((a, b) {
            return a.title.toString().compareTo(b.title.toString());
          },);
        }
       }
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
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  )
                                ),
                             child: Center(child: DText(color: ColorManager.textColorWhite, text: "Notice", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s16)),

                              ),
                              const SizedBox(height: 10,),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DText(
                                      lines: 9,
                                      color: ColorManager.textColorBlack, text: state.noticeModel[index].shortDescription??"", weight: FontWeightManager.light, family: FontConstants.fontPoppins, size: FontSize.s14),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: const Text("Ok"))
                            ],
                          ),
                        ),
                      );
                    }):Navigator.push(context, MaterialPageRoute(builder: (context){
                      return NoticeDetails(datas: state.noticeModel[index].description,);
                    }));
      },
      child: Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              color: UserSimplePreferences.getDark()==true?Colors.black:Colors.white,
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
                  color: UserSimplePreferences.getDark()==true?ColorManager.textColorWhite:ColorManager.textColorBlack, text: title, weight: FontWeightManager.regular, family: FontConstants.fontNoto, size: FontSize.s14),
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




//search
class NotificationsSearch extends StatelessWidget {
  int index;
  var list;
String title;
String time;
   NotificationsSearch({
    Key? key,
    required this.index,
    required this.list,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
      
                  list[index].description==null?  showDialog(
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
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  )
                                ),
                             child: Center(child: DText(color: ColorManager.textColorWhite, text: "Notice", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s16)),

                              ),
                              const SizedBox(height: 10,),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height*0.28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DText(
                                      lines: 9,
                                      color: ColorManager.textColorBlack, text: list[index].shortDescription??"", weight: FontWeightManager.light, family: FontConstants.fontPoppins, size: FontSize.s14),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: const Text("Ok"))
                            ],
                          ),
                        ),
                      );
                    }):Navigator.push(context, MaterialPageRoute(builder: (context){
                      return NoticeDetails(datas:list[index].description);
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
                          color:  list[index].description==null? Colors.red:Colors.green,
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
