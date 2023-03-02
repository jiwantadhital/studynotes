import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';
import 'package:rive/rive.dart';

class ForLogged extends StatefulWidget {
  const ForLogged({super.key});

  @override
  State<ForLogged> createState() => _ForLoggedState();
}

class _ForLoggedState extends State<ForLogged> {
    late RiveAnimationController _controller;
  
  bool op = false;
  opac(){
    op=true;
    setState(() {
      
    });
  }
  _goNext(){
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return BottomBarPage();
   }));
  }
  @override
  void initState() {
    if(UserSimplePreferences.getRemember()==false){
      UserSimplePreferences.removeEmailPassword();
    }
    _controller = SimpleAnimation('Loading');
   opac();
   Timer(Duration(seconds: 3), _goNext);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/splashi.png"
                      )
                    )
                  ),
                ),
               Column(
                children: [
                SizedBox(height: MediaQuery.of(context).size.height*0.15,),
                DText(color: ColorManager.textColorBlack, text: "Welcome Back",
               weight: FontWeightManager.bold, family: FontConstants.fontNoto, size: FontSize.s36),
               SizedBox(height: 10,),
               DText(color: ColorManager.textColorBlack, text: UserSimplePreferences.getUsername()??"User",
               weight: FontWeightManager.regular, family: FontConstants.fontNunito, size: FontSize.s22),
               SizedBox(height: 20,),
               Container(
                color: Colors.white,
                height: 200,
                child: RiveAnimation.asset("assets/images/b.riv",
                controllers: [
                  _controller
                ],
                )),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                DText(color: ColorManager.textColorBlack, text: "Read all you want",
               weight: FontWeightManager.light, family: FontConstants.fontNunito, size: FontSize.s17),
                ],
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


class SocialBox extends StatelessWidget {
String text;
String icon;
SocialBox({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.black.withOpacity(0.7),),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width*0.08,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
              ),
            ),
          ),
          SizedBox(width: 20,),
          Text(text,
          style: TextStyle(
            fontSize:16,
            fontWeight: FontWeightManager.semibold,
            fontFamily: FontConstants.fontNunito,
            color: ColorManager.primaryColor
          ),
          ),
        ],
      ),
    );
  }
}

