import 'package:flutter/material.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../home_pages/widgets/home_page_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
    bool remember = false;
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return Column(
                      children: [
                        AuthTextBox(
                          labelText: "User Name",
                          hide: false,
                        ),
                           SizedBox(height: 20,),
                        AuthTextBox(
                          labelText: "Email",
                        ),
                        SizedBox(height: 20,),
                         AuthTextBox(
                          labelText: "Phone Number",
                        ),
                        SizedBox(height: 20,),
                        AuthTextBox(
                          labelText: "Password",
                          hide: false,
                          icon: Icons.remove_red_eye,
                          tap: (){
                            hide == false?hide= true:hide=false;
                            setState(() {
                              
                            });
                          },
                        ),
         
                       
         
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                              return BottomBarPage();
                            }));
                          },
                          child: AuthButton(text: "Register",)),
               
                      ],
                    );
                  
  }
}