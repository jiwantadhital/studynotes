// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:studynotes/presentation/auth_pages/login.dart';
import 'package:studynotes/presentation/auth_pages/register.dart';

import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool loginselected = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
       decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            ColorManager.primaryColor, 
             Colors.grey[200]!,
        ])
       ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                child: 
              Container(
                height: size.height*0.32,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(
                    "assets/images/lb.png"
                  ),
                  fit: BoxFit.cover,opacity: 0.1
                  ),
                ),
                child: Center(child: 
               Column(
                mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   DText(color: ColorManager.textColorWhite, text: "Welcome User", weight: FontWeightManager.semibold, family: FontConstants.fontNoto, size: FontSize.s30),
                   SizedBox(
                    height: 5,
                   ),
                  loginselected==true?DText(color: ColorManager.textColorWhite, text: "Please Create Your Account", weight: FontWeightManager.semibold, family: FontConstants.fontNunito, size: FontSize.s20):  DText(color: ColorManager.textColorWhite, text: "Please Login To Continue", weight: FontWeightManager.semibold, family: FontConstants.fontNunito, size: FontSize.s20),
                    SizedBox(height: 40,)
                 ],
               )
                ),
              )
              ),
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height*0.19,
                    width: MediaQuery.of(context).size.width,
                   
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
                        padding: EdgeInsets.only(left: 10,right: 10,top: 60),
                        height: MediaQuery.of(context).size.height*0.74,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )
                        ),
                        child: loginselected==false? Login():Register()
                      ),
                        Positioned(
                child: Container(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(width: 10,),
                      GestureDetector(
                        onTap: (){
                          loginselected = false;
                          setState(() {
                            
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: loginselected == false? 60 : 55,
                          width: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                                     color: loginselected == true?ColorManager.boxGreen: ColorManager.boxBlue,
                                     border: Border.all(width: 4,color: Colors.white)
                               ),
                               child: Center(
                                child: DText(color: ColorManager.textColorWhite, text: "Login", weight: FontWeightManager.semibold, family: FontConstants.fontNoto, size: FontSize.s16),
                               ),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          loginselected = true;
                          setState(() {
                            
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 500),
                          height: loginselected == false? 55 :60 ,
                          width: 130,
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                                        color: loginselected == false? ColorManager.boxGreen : ColorManager.boxBlue,
                                        border: Border.all(width: 4,color: Colors.white)
                                      ),
                                      child: Center(
                                child: DText(color: ColorManager.textColorWhite, text: "Register", weight: FontWeightManager.semibold, family: FontConstants.fontNoto, size: FontSize.s16),
                               ),
                        ),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
        ),
              ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

