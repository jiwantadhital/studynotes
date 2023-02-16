import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/presentation/auth_pages/google/google_sign.dart';
import 'package:studynotes/presentation/auth_pages/social_login.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/setting/edit_profile/edit_profile.dart';
import 'package:studynotes/presentation/setting/report/report.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
    File? image;
Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
if(image == null) return;
final imageTemp = File(image.path);
setState(() => this.image = imageTemp);
    } on PlatformException catch(e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
        print( UserSimplePreferences.getGooglePhoto());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: DText(text: "Profile",color: ColorManager.textColorWhite,weight: FontWeightManager.semibold,size: FontSize.s20, family: FontConstants.fontNunito,),),
      ),
      body: Stack(
        children: [

          Container(
            margin: EdgeInsets.all(10),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width*0.35,
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                       image != null?
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 7,color: Colors.white),
                            image: DecorationImage(image: FileImage(image!),fit: BoxFit.cover)
                          ),
                        )
                        :Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(width: 7,color: Colors.white),
                            image: DecorationImage(image: NetworkImage(UserSimplePreferences.getGooglePhoto()??"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2WPSnSP44UbxEKVUsVg8AT2Sf43whBNwsHw&usqp=CAU"),fit: BoxFit.cover)
                          ),
                        ),
                        Positioned(
                          top: 60,
                          left: MediaQuery.of(context).size.width*0.53,
                          child: GestureDetector(
                            onTap: (){
                              pickImage();
                              setState(() {
                                print(image);
                              });
                            },
                            child: Container(
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: ColorManager.primaryColor
                              ),
                              child: Icon(Icons.edit,color: Colors.white,size: 15,),
                            ),
                          ),
                          ),
            
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                DText(text: UserSimplePreferences.getUsername()??"User",color: ColorManager.textColorBlack,weight: FontWeightManager.bold,family: FontConstants.fontNunito,size: FontSize.s15,),
                                DText(text: "9815261522",color: ColorManager.textColorBlack,weight: FontWeightManager.regular,family: FontConstants.fontNunito,size: FontSize.s13,),
                              ],
                            ))
                      ],
                    ),
                           
                    
                  ),
                  SizedBox(height: 10,),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                                    Navigator.push(context, 
                             MaterialPageRoute(builder: (context){
                               return EditProfile();
                           })
                                );
                          },
                          child: ProfileBoxes(fIcon: Icons.person,sIcon: Icons.arrow_forward_ios,boxText: "Edit Profile",)),
                        SizedBox(height: 10,),
                        ProfileBoxes(fIcon: Icons.download_done,sIcon: Icons.arrow_forward_ios,boxText: "Downloads",),
                        SizedBox(height: 10,),
                        ProfileBoxes(fIcon: Icons.error,sIcon: Icons.arrow_forward_ios,boxText: "Report a problem",
                        tap: (){
                            Navigator.push(context, 
                             MaterialPageRoute(builder: (context){
                               return Report();
                           })
                                );
                        },
                        ),
                        SizedBox(height: 10,),
                        ProfileToggle(fIcon: Icons.remove_red_eye,button: Switch(
                          activeColor: Theme.of(context).primaryColor,
                          value: true, onChanged: (val){
                          }),boxText: "Dark Mode",),
                        SizedBox(height: 10,),
                        ProfileBoxes(fIcon: Icons.share,sIcon: Icons.arrow_forward_ios,boxText: "Invite",),
                        SizedBox(height: 10,),
                      ProfileBoxes(fIcon: Icons.logout,boxText: "Logout",color: Colors.red,
                        tap: (){
                          showModalBottomSheet<void>(
                                isScrollControlled: true,
                                enableDrag: true,
                          context: context,
                          builder: (BuildContext context) {
                           return Container(
                                height: 150,
                                width: double.maxFinite,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                                  color: Colors.white
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    DText(text: "Logout",color: Colors.red,size: FontSize.s20,weight: FontWeightManager.semibold,family: FontConstants.fontNunito,),
                                                                  SizedBox(height: 10,),
                                      DText(text: "Are you sure you want to logout?",color: Colors.black,size: FontSize.s15,weight: FontWeightManager.semibold,family: FontConstants.fontNunito,),
                                                                  SizedBox(height: 20,),
                                         Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          height:40,
                          width: MediaQuery.of(context).size.width*0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.withOpacity(0.7),
                          ),
                          child: Center(child: Center(child: DText(text: "Cancel",size: FontSize.s15,weight: FontWeightManager.semibold,family: FontConstants.fontPoppins,color: ColorManager.textColorWhite,)),),
                        ),
                      ),
                      GestureDetector(
                        onTap: (){
                          UserSimplePreferences.logout();
                          UserSimplePreferences.removeUserDetails();
                          GoogleSignInApi.logout();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return SocialLogin();
                              }));
                        },
                        child: Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width*0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Center(child: DText(text: "Yes",size: FontSize.s15,weight: FontWeightManager.semibold,family: FontConstants.fontPoppins,color: ColorManager.textColorWhite,)),
                        ),
                      )
                    ],
                                   )
                                  ],
                                ),
                              );
                        },
                          );
                          
                        },
                        ),
                        SizedBox(height: 10,),
                      
                      ],
                    ),
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  doNothing(){}
}

class ProfileBoxes extends StatelessWidget {
IconData fIcon;
IconData? sIcon;
String boxText;
Color color;
void Function()? tap;
ProfileBoxes({required this.boxText,required this.fIcon,  this.sIcon, this.color=Colors.black, this.tap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: SizedBox(
        height: 40,
        width: double.maxFinite,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(fIcon,color: Theme.of(context).primaryColor,),
                SizedBox(width: 20,),
              DText(text: boxText, color: color,size: FontSize.s15,family: FontConstants.fontPoppins,weight: FontWeightManager.medium,)
              ],
            ),
            Icon(sIcon,color: ColorManager.primaryColor,)
          ],
        ),
      ),
    );
  }
}

class ProfileToggle extends StatelessWidget {
IconData fIcon;
IconData? sIcon;
String boxText;
Color color;
Widget button;
ProfileToggle({required this.boxText,required this.fIcon, required this.button, this.color=Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(fIcon,color: Theme.of(context).primaryColor,),
              SizedBox(width: 20,),
              DText(text: boxText, color: color,size: FontSize.s15,family: FontConstants.fontPoppins,weight: FontWeightManager.medium,)
            ],
          ),
          button
        ],
      ),
    );
  }
}