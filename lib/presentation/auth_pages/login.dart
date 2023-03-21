import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/auth/login/bloc/login_bloc.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/presentation/auth_pages/otp_page.dart';
import 'package:studynotes/presentation/auth_pages/social_login.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
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
  var emailController = TextEditingController(text: UserSimplePreferences.getEmail());
  var passwordController = TextEditingController(text:UserSimplePreferences.getPassword());
    bool remember = UserSimplePreferences.getRemember()??false;
  bool hide = true;
  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(UserSimplePreferences.getRemember()==false){
      UserSimplePreferences.removeEmailPassword();
    }
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
                            icon:hide==true? Icons.remove_red_eye:Icons.remove_red_eye_outlined,
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
                                    UserSimplePreferences.setRemember(val);
                                    setState(() {
                                      
                                    });
                                }),
                                DText(color: ColorManager.textColorBlack, text: "Remember me", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14)
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                      BlocConsumer<LoginBloc,LoginState>(builder: (context,state){
                        return AuthButton(
                          text: "Login",
                       tap: (){
                         if(_formKey.currentState!.validate()){
                             context.read<LoginBloc>()..add(LoggingEvent(email: emailController.text, password: passwordController.text));
                             
                         }
                         else{
                        print("err");
                         }
                       },
                       );

                      }, listener: (context,state){
                        if(state is LoginLoading){
                                  DialogBox().dialogbox(context);
                        }
                        if(state is LoginError){
                          Navigator.pop(context);
                         ScaffoldMessenger.of(context).showSnackBar(
                                    ShowSnackBar().snack(
                                        "Something went wrong", Colors.red));
                        }
                          if(state is LoginOtp){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                           return OTPPage();
                         }));
                        }
                        if(state is LoginDone){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                           return BottomBarPage();
                         }));
                        }
                        
                      }),
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
                                    width: MediaQuery.of(context).size.width*0.4,
                                    child: Divider(thickness: 2,color: ColorManager.primaryColor,)),
                                  DText(color: ColorManager.textColorBlack, text: "Or", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14),
                                  Container(
                                    width: MediaQuery.of(context).size.width*0.4,
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
                                  GestureDetector(
                                    onTap: (){
                                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                            return SocialLogin();
                                             }));
                                    },
                                    child: DText(color: ColorManager.boxBlue, text: "social login", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14)),
                                ],
                              ),
                            )
                        ],
                      ),
    );
                  
  }
}