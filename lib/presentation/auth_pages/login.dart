import 'package:flutter/material.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../home_pages/widgets/home_page_widgets.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
    bool remember = false;
  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey,
      child: Column(
                        children: [
                          AuthTextBox(
                            validation: (val){
                              if(val == null || val.isEmpty){
                                return 'Please enter some text';
                              }
                            },
                            controller: emailController,
                            labelText: "Email",
                          ),
                          SizedBox(height: 20,),
                          AuthTextBox(
                            controller: passwordController,
                            labelText: "Password",
                            validation: (val){
                              if(val.length != 6 && val.length < 6 ){
                                return "Password is too short";
                              }
                              if (val == null || val.isEmpty) {
                             return 'Please enter some text';
                                 }
                                 return null;
                            },
                            hide: hide,
                            icon: Icons.remove_red_eye,
                            tap: (){
                              hide == false?hide= true:hide=false;
                              setState(() {
                                
                              });
                            },
                          ),
                          SizedBox(height: 10,),
                          Container(
                            height: 40,
                            width: double.maxFinite,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  activeColor: ColorManager.primaryColor,
                                  value: remember,
                                   onChanged: (val){
                                    remember = val!;
                                    setState(() {
                                      
                                    });
                                }),
                                DText(color: ColorManager.textColorBlack, text: "Remember me", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14)
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                       GestureDetector(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context){
                              //   return BottomBarPage();
                              // }));
                            },
                            child: AuthButton(text: "Login",
                            tap: (){
                              if(_formKey.currentState!.validate()){
                                UserSimplePreferences.setToken("12");
                              //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                              //   return BottomBarPage();
                              // }));
                              }
                              else{
                             print("err");
                              }
                            },
                            )),
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: DText(color: ColorManager.boxBlue, text: "Forgot Password ?", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14),
                            )),
                            SizedBox(height: 10,),
                            Container(
                              height: 20,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    width: 170,
                                    child: Divider(thickness: 2,color: ColorManager.primaryColor,)),
                                  DText(color: ColorManager.textColorBlack, text: "Or", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14),
                                  Container(
                                    width: 170,
                                    child: Divider(thickness: 2,color: ColorManager.primaryColor,)),
                                ],
                              ),
                            ),
                            SizedBox(height: 20,),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  DText(color: ColorManager.textColorBlack, text: "Continue with ", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14),
                                  DText(color: ColorManager.boxBlue, text: "social login", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14),
                                ],
                              ),
                            )
                        ],
                      ),
    );
                  
  }
}