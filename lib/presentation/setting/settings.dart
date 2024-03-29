import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/auth/getProfile/bloc/profile_bloc.dart';
import 'package:studynotes/logic/database/chapters/bloc/chapters_bloc.dart';
import 'package:studynotes/logic/notes/subjects/bloc/subjects_bloc.dart';
import 'package:studynotes/presentation/auth_pages/google/google_sign.dart';
import 'package:studynotes/presentation/auth_pages/social_login.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/setting/downloads/downloaded.dart';
import 'package:studynotes/presentation/setting/edit_profile/edit_profile.dart';
import 'package:studynotes/presentation/setting/invite/invite.dart';
import 'package:studynotes/presentation/setting/report/report.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool dark = UserSimplePreferences.getDark()??false;
  String image = UserSimplePreferences.getGooglePhoto() ?? "";
  @override
  void initState() {
    // context.read<ProfileBloc>().add(GetProfileEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
        context.read<SubjectsBloc>().add(SubjectGettingEvent(id: 1));
    return Scaffold(
      backgroundColor:dark==true?Colors.black: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: DText(
            text: "Profile",
            color: ColorManager.textColorWhite,
            weight: FontWeightManager.semibold,
            size: FontSize.s20,
            family: FontConstants.fontNunito,
          ),
        ),
      ),
      body: Stack(
        children: [
          BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
             if(state is ProfileLoading){
              return const Center(child: CircularProgressIndicator(),);
             }
             if(state is ProfileError){

             }
             if(state is ProfileGot){
              return Container(
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width * 0.35,
                        width: double.maxFinite,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border:
                                      Border.all(width: 7, color: dark==true?Colors.grey:Colors.white,),
                                  image: DecorationImage(
                                      image: MemoryImage(base64Decode(state.profileModel.image??UserSimplePreferences.getGooglePhoto() ?? imageAll)),
                                      fit: BoxFit.cover)),
                            ),
                            Positioned(
                              top: 60,
                              left: MediaQuery.of(context).size.width * 0.53,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return EditProfile(
                                      phone: state.profileModel.phone.toString(),
                                      college: "a",
                                      sem: state.profileModel.semId.toString(),
                                      image: state.profileModel.image.toString(),
                                    );
                                  })).then((value) {
                                     context.read<ProfileBloc>().add(GetProfileEvent());
                                    setState(() {
                                      
                                    });
                                  });
                                },
                                child: Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: ColorManager.primaryColor),
                                  child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    DText(
                                      text:
                                          UserSimplePreferences.getUsername() ??
                                              state.profileModel.name??"",
                                      color: dark==true?Colors.white:Colors.black,
                                      weight: FontWeightManager.bold,
                                      family: FontConstants.fontNunito,
                                      size: FontSize.s15,
                                    ),
                                    DText(
                                      text: UserSimplePreferences.getEmail() ??
                                          state.profileModel.user!.email??"",
                                     color: dark==true?Colors.white:Colors.black,
                                      weight: FontWeightManager.regular,
                                      family: FontConstants.fontNunito,
                                      size: FontSize.s13,
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return EditProfile(
                                      phone: state.profileModel.phone.toString(),
                                      college: "a",
                                      sem: state.profileModel.semId.toString(),
                                      image: state.profileModel.image??imageAll,
                                    );
                                  })).then((value) {
                                    context.read<ProfileBloc>().add(GetProfileEvent());
                                    setState(() {
                                      
                                    });
                                  });
                                },
                                child: ProfileBoxes(
                                  color: dark==true?Colors.white:Colors.black,
                                  fIcon: Icons.person,
                                  sIcon: Icons.arrow_forward_ios,
                                  boxText: "Edit Profile",
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            ProfileBoxes(
                              color: dark==true?Colors.white:Colors.black,
                              fIcon: Icons.download_done,
                              sIcon: Icons.arrow_forward_ios,
                              boxText: "Downloads",
                              tap: () {
                                context.read<ChaptersBloc>()
                                  .add(ChaptersSubjectEvent());
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Downloaded();
                                }));
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ProfileBoxes(
                              color: dark==true?Colors.white:Colors.black,
                              fIcon: Icons.error,
                              sIcon: Icons.arrow_forward_ios,
                              boxText: "Report a problem",
                              tap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const Report();
                                }));
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ProfileToggle(
                              color: dark==true?Colors.white:Colors.black,
                              fIcon: Icons.remove_red_eye,
                              button: Switch(
                                  activeColor: Theme.of(context).primaryColor,
                                  value: dark,
                                  onChanged: (val) {
                                    dark = val;
                                    setState(() {
                                      UserSimplePreferences.setDark(val);
                                      print(val);
                                    });
                                  }),
                              boxText: "Dark Mode",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ProfileBoxes(
                              tap: (){
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  context: context, builder: (context){
                                  return const InvitePage();
                                });
                              },
                              color: dark==true?Colors.white:Colors.black,
                              fIcon: Icons.share,
                              sIcon: Icons.arrow_forward_ios,
                              boxText: "Invite",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ProfileBoxes(
                              fIcon: Icons.logout,
                              boxText: "Logout",
                              color: Colors.red,
                              tap: () {
                                showModalBottomSheet<void>(
                                  isScrollControlled: true,
                                  enableDrag: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: 150,
                                      width: double.maxFinite,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)),
                                          color: Colors.white),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          DText(
                                            text: "Logout",
                                            color: Colors.red,
                                            size: FontSize.s20,
                                            weight: FontWeightManager.semibold,
                                            family: FontConstants.fontNunito,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          DText(
                                            text:
                                                "Are you sure you want to logout?",
                                            color: Colors.black,
                                            size: FontSize.s15,
                                            weight: FontWeightManager.semibold,
                                            family: FontConstants.fontNunito,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Colors.grey
                                                        .withOpacity(0.7),
                                                  ),
                                                  child: Center(
                                                    child: Center(
                                                        child: DText(
                                                      text: "Cancel",
                                                      size: FontSize.s15,
                                                      weight: FontWeightManager
                                                          .semibold,
                                                      family: FontConstants
                                                          .fontPoppins,
                                                      color: ColorManager
                                                          .textColorWhite,
                                                    )),
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  UserSimplePreferences
                                                      .logout();
                                                  UserSimplePreferences
                                                      .removeUserDetails();
                                                  UserSimplePreferences
                                                      .setVerified(false);
                                                  GoogleSignInApi.logout();
                                                  Navigator.pushAndRemoveUntil(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return const SocialLogin();
                                                  }), (Route<dynamic> route) => false);
                                                },
                                                child: Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                  child: Center(
                                                      child: DText(
                                                    text: "Yes",
                                                    size: FontSize.s15,
                                                    weight: FontWeightManager
                                                        .semibold,
                                                    family: FontConstants
                                                        .fontPoppins,
                                                    color: ColorManager
                                                        .textColorWhite,
                                                  )),
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
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              );
             }
             return const Center(child: Text("Err"),);
            },
          ),
        ],
      ),
    );
  }

  doNothing() {}
}

class ProfileBoxes extends StatelessWidget {
  IconData fIcon;
  IconData? sIcon;
  String boxText;
  Color color;
  void Function()? tap;
  ProfileBoxes(
      {super.key, required this.boxText,
      required this.fIcon,
      this.sIcon,
      this.color = Colors.black,
      this.tap});

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
                Icon(
                  fIcon,
                  color: Theme.of(context).primaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                DText(
                  text: boxText,
                  color: color,
                  size: FontSize.s15,
                  family: FontConstants.fontPoppins,
                  weight: FontWeightManager.medium,
                )
              ],
            ),
            Icon(
              sIcon,
              color: ColorManager.primaryColor,
            )
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
  ProfileToggle(
      {super.key, required this.boxText,
      required this.fIcon,
      required this.button,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                fIcon,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(
                width: 20,
              ),
              DText(
                text: boxText,
                color: color,
                size: FontSize.s15,
                family: FontConstants.fontPoppins,
                weight: FontWeightManager.medium,
              )
            ],
          ),
          button
        ],
      ),
    );
  }
}
