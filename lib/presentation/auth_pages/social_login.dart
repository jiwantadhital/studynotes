import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/auth/google/bloc/google_bloc.dart';
import 'package:studynotes/presentation/auth_pages/auth_page.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/presentation/auth_pages/google/google_sign.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/extra_widgets/loadings.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class SocialLogin extends StatefulWidget {
  const SocialLogin({super.key});

  @override
  State<SocialLogin> createState() => _SocialLoginState();
}

class _SocialLoginState extends State<SocialLogin> {
  bool op = false;
  opac() {
    op = true;
    setState(() {});
  }

  @override
  void initState() {
    Timer(const Duration(milliseconds: 100), opac);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/splashi.png"))),
                ),
                AnimatedOpacity(
                  opacity: op == false ? 0 : 1,
                  duration: const Duration(seconds: 2),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      DText(
                        text: "Let's you in",
                        color: Colors.black.withOpacity(0.7),
                        weight: FontWeightManager.extrabold,
                        family: FontConstants.fontNoto,
                        size: FontSize.s26,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SocialBox(
                        icon: "assets/images/face.png",
                        text: "Continue with Facebook",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                          onTap: () {
                            signIn(context);
                            setState(() {});
                          },
                          child: BlocConsumer<GoogleBloc, GoogleState>(
                            listener: (context, state) {
                              if(state is GoogleLoading){
                                 dialogBuilder(
                                     context,
                                         "Please wa..",
                                      );
                              }
                              if(state is GoogleLoggedIn){
                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                           return const BottomBarPage();
                         }), (Route<dynamic> route) => false);
                              }
                              if(state is GoogleError){
                               Navigator.pop(context);
                               ScaffoldMessenger.of(context).showSnackBar(
                                    ShowSnackBar().snack(
                                        "Something went wrong", Colors.red));
                              }
                            },
                            builder: (context, state) {
                              return SocialBox(
                                icon: "assets/images/goog.png",
                                text: "Continue with Google",
                              );
                            },
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      SocialBox(
                        icon: "assets/images/appl.png",
                        text: "Continue with Apple",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.43,
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.black.withOpacity(0.7),
                              )),
                          DText(
                              text: "or",
                              color: Colors.black.withOpacity(0.7),
                              weight: FontWeightManager.regular,
                              family: FontConstants.fontNunito,
                              size: FontSize.s14),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.43,
                              child: Divider(
                                height: 1,
                                thickness: 1,
                                color: Colors.black.withOpacity(0.7),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: AuthButton(
                            text: "Sign in with Password",
                            tap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const AuthPage();
                              }));
                            },
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DText(
                              text: "Don't have an account ?",
                              color: Colors.black,
                              weight: FontWeightManager.regular,
                              family: FontConstants.fontNunito,
                              size: FontSize.s14),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return const AuthPage();
                              }));
                            },
                            child: DText(
                                text: "Click here",
                                color: Colors.blue,
                                weight: FontWeightManager.regular,
                                family: FontConstants.fontNunito,
                                size: FontSize.s14),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//for google log in
Future signIn(context) async {
  dialogBuilder(
    context,
    "Please wait..",
  );
  try {
 await GoogleSignInApi.login(context);
     Navigator.pop(context);
  } catch (e) {
    print(e);
    Navigator.pop(context);
  }
}

class SocialBox extends StatelessWidget {
  String text;
  String icon;
  SocialBox({super.key, required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.08,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(icon),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeightManager.semibold,
                fontFamily: FontConstants.fontNunito,
                color: ColorManager.primaryColor),
          ),
        ],
      ),
    );
  }
}
