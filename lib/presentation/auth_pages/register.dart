import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/auth/register/bloc/register_bloc.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../home_pages/widgets/home_page_widgets.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
    final _formKey1 = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

    bool remember = false;
  bool hide = false;
  @override
  Widget build(BuildContext context) {
    return Form(
         autovalidateMode: AutovalidateMode.onUserInteraction,
      key: _formKey1,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
                          children: [
                            AuthTextBox(
                              validation: (val){
                                if(val == null || val.isEmpty){
                                    return 'Please enter some text';
                                  }
                              },
                              controller: nameController,
                              labelText: "User Name",
                              hide: false,
                            ),
                               SizedBox(height: 20,),
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
                              validation: (val){
                                if(val == null || val.isEmpty){
                                    return 'Please enter some text';
                                  }
                                  if(val.length >10){
                                    return 'Number cannot be greater than 10';
                                  }
                              },
                              type: TextInputType.number,
                              controller: phoneController,
                              labelText: "Phone Number",
                            ),
                            SizedBox(height: 20,),
                            AuthTextBox(
                              validation: (val){
                                 if(val.length != 6 && val.length < 6 ){
                                    return "Password is too short";
                                  }
                              },
                              controller: passwordController,
                              labelText: "Password",
                              hide: hide,
                              icon:hide == false?Icons.remove_red_eye_outlined: Icons.remove_red_eye,
                              tap: (){
                                hide == false?hide= true:hide=false;
                                setState(() {
                                  
                                });
                              },
                            ),
             
                           
             
                            SizedBox(height: 20,),
                           BlocConsumer<RegisterBloc,RegisterState>(builder: (context,state){
                            return AuthButton(text: "Register",
                            tap: (){
                              if(_formKey1.currentState!.validate()){
                              context.read<RegisterBloc>()..add(RegisteringEvent(
                                email: emailController.text,
                                name: nameController.text,
                                phone: phoneController.text,
                                password: passwordController.text,
                                ));
                             }
                            },
                            );
                           }, listener: (context,state){
                            if(state is RegisterLoading){
                                    DialogBox().dialogbox(context);
                          }
                          if(state is RegisterError){
                            Navigator.pop(context);
                            print(state.message);
                          }
                          if(state is RegisterDone){
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                             return BottomBarPage();
                           }));
                          }
                           })
                   
                          ],
                        ),
      ),
    );
                  
  }
}