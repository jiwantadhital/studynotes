import 'package:flutter/material.dart';
import 'package:studynotes/presentation/auth_pages/auth_page.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/presentation/auth_pages/register.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';


class SocialLogin extends StatelessWidget {
  const SocialLogin({super.key});

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
                // TopSection(),
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
                SizedBox(height: 20,),
                DText(text: "Let's you in", color: Colors.black.withOpacity(0.7),weight: FontWeightManager.extrabold,family: FontConstants.fontNoto,size: FontSize.s26,),
                SizedBox(height: 20,),
                SocialBox(icon: "assets/images/face.png",text: "Continue with Facebook",),
                SizedBox(height: 10,),
                SocialBox(icon: "assets/images/goog.png",text: "Continue with Google",),
                SizedBox(height: 10,),
                SocialBox(icon: "assets/images/appl.png",text: "Continue with Apple",),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width*0.43,
                      child: Divider(height: 1,thickness: 1,color: Colors.black.withOpacity(0.7),)),
                    DText(text: "or", color: Colors.black.withOpacity(0.7),weight: FontWeightManager.regular,family: FontConstants.fontNunito,size: FontSize.s14),
                    SizedBox(width: MediaQuery.of(context).size.width*0.43,
                      child: Divider(height: 1,thickness: 1,color: Colors.black.withOpacity(0.7),)),
                  ],
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                   
                  },
                  child: 
                  AuthButton(text: "Sign in with Password")
                  ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DText(text: "Don't have an account ?", color: Colors.black,weight: FontWeightManager.regular,family: FontConstants.fontNunito,size: FontSize.s14),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context){
                              return AuthPage();
                            }));
                      },
                      child: DText(text: "Click here", color: Colors.blue,weight: FontWeightManager.regular,family: FontConstants.fontNunito,size: FontSize.s14),
),
                  ],
                ),
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

