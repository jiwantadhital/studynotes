// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool search = false;
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
              NotificationsWidget(header: "Today",title: "The result of 5th semester was delayed due to various",time: "2h ago",),
              const SizedBox(height: 10,),
              NotificationsWidget(header: "This Week",title: "The result of 5th semester was delayed due to various",time: "2h ago",),
              const SizedBox(height: 10,),
              NotificationsWidget(header: "All",title: "The result of 5th semester was delayed due to various",time: "2h ago",),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsWidget extends StatelessWidget {
String header;
String title;
String time;
   NotificationsWidget({
    Key? key,
    required this.header,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10,top: 10),
            child: DText(color: ColorManager.textColorBlack, text: header, weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s20),
          )),
        // SizedBox(height: 10,),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context,index){
          return Container(
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
                        color: Colors.red,
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
        );
        })
      ],
    );
  }
}
