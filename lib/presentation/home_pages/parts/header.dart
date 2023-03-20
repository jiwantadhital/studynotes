// import 'dart:async';
// import 'dart:convert';

// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';
// import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
// import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
// import 'package:studynotes/presentation/home_pages/parts/open_search_page.dart';
// import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
// import 'package:studynotes/presentation/notification/notifications.dart';
// import 'package:studynotes/resources/fonts.dart';

// import '../../../resources/colors.dart';

// class TopHeader extends StatefulWidget {
//   const TopHeader({
//     super.key,
//     required this.size,
//   });

//   final Size size;

//   @override
//   State<TopHeader> createState() => _TopHeaderState();
// }

// class _TopHeaderState extends State<TopHeader> {
//     bool _slowAnimations = false;
//     ContainerTransitionType _transitionType = ContainerTransitionType.fade;

//    aaData(){
//     Timer(Duration(milliseconds:100), () {
//       setState(() {
        
//       });
//      });
//   }
// @override
//   void initState() {
//     aaData();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//           children: [
//             Container(
//               height: 70,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                  Row(
//                   children: [
//                      Container(
//                     height: 50,
//                     width: 50,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       shape: BoxShape.circle,
//                       border: Border.all(width: 2,color: Colors.white),
//                       image:  DecorationImage(image: MemoryImage(
//                         base64Decode(UserSimplePreferences.getGooglePhoto()??"")),fit: BoxFit.cover),
//                     ),
//                   ),
//                   const SizedBox(width: 20,),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: MediaQuery.of(context).size.width*0.5,
//                         child: DText(
//                           lines: 2,
//                           family: FontConstants.fontPoppins,
//                           weight: FontWeightManager.bold,
//                           size: FontSize.s16,
//                           color: ColorManager.textColorWhite,
//                           text: "Hello, ${UserSimplePreferences.getUsername()??"User"}",
                          
//                         ),
//                       ),
//                       DText(
//                         family: FontConstants.fontPoppins,
//                         weight: FontWeightManager.light,
//                         size: FontSize.s14,
//                         color: ColorManager.textColorWhite,
//                         text: "Let's start learning",
                        
//                       ),
//                     ],
//                   ),
//                   ],
//                  ),
//                     Container(
//                     height: 45,
//                     width: 45,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).primaryColor,
//                       shape: BoxShape.circle,
//                       border: Border.all(width: 2,color: Colors.white),
//                     ),
//                     child: Stack(
//                         alignment: Alignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: (){
//                                                       Navigator.push(context, 
//                            MaterialPageRoute(builder: (context){
//                              return Notifications();
//                          })
//               );
//                           },
//                           child: const Icon(Icons.notifications,size: 30,color: Colors.white,)),
//                         Positioned(
//                           left: 20,
//                           bottom: 22,
//                           child: Container(
//                             height: 14,
//                             width: 14,
//                             decoration: BoxDecoration(
//                               color: Colors.red,
//                               borderRadius: BorderRadius.circular(10)
//                             ),
//                             child: Center(child: DText(text: "5",color: Colors.white,size: 8,weight: FontWeight.w800,family: FontConstants.fontPoppins,)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10,),
//              OpenContainer(
//               transitionDuration: Duration(milliseconds: 500),
//               transitionType: _transitionType,
//               closedBuilder: (BuildContext _, VoidCallback openContainer){
//                 return  Stack(
//               alignment: Alignment.centerRight,
//               children: [
               
//                 Container(
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                     child: Row(
//                       children: [
//                         SizedBox(width: 10,),
//                         Icon(Icons.search,color: Colors.grey,),
//                         SizedBox(width: 10,),
//                         DText(color: Colors.grey, text: "Search all subjects", weight: FontWeightManager.medium, family: FontConstants.fontNunito, size: FontSize.s12)
//                       ],
//                     ),
//                 ),
//                 Positioned(
//                   right: 10,
//                   child: Container(
//                     height: 40,
//                     width: 40,
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).primaryColor,
//                       borderRadius: BorderRadius.circular(10)
//                     ),
//                     child: const Center(child: Icon(Icons.menu,color: Colors.white,),),
//                   ),
//                   ),
//               ],
//             );
//               },
//                openBuilder: (BuildContext _, VoidCallback __){
//                     return OpenSearchPage();
//                    }
//               ),
           
//           ],
//       )
//       );
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/auth/getProfile/bloc/profile_bloc.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/notification/notifications.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../../local_databases/sharedpreferences/shared_pref.dart';

class Top extends StatefulWidget {
  const Top({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
getProfile(){
  Future.delayed(Duration(milliseconds: 200),(){
    setState(() {
      
    });
  });
}
@override
  void initState() {
    getProfile();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(width: 2, color: Colors.white),
                              image: DecorationImage(
                                  image: MemoryImage(base64Decode(
                                     context.read<ProfileBloc>().authController.profileModel.image??UserSimplePreferences
                                              .getGooglePhoto() ??
                                        imageAll)),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: widget.size.width * 0.5,
                                  child: DText(
                                    lines: 1,
                                    family: FontConstants.fontPoppins,
                                    weight: FontWeightManager.bold,
                                    size: FontSize.s16,
                                    color: ColorManager.textColorWhite,
                                    text:
                                        "Hello, ${UserSimplePreferences.getUsername() ?? "User"}",
                                  ),
                                ),
                                DText(
                                  lines: 1,
                                  family: FontConstants.fontPoppins,
                                  weight: FontWeightManager.light,
                                  size: FontSize.s14,
                                  color: ColorManager.textColorWhite,
                                  text: "Let's start learning",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: ColorManager.primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(width: 2, color: Colors.white),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return Notifications();
                                  }));
                                },
                                child: const Icon(
                                  Icons.notifications,
                                  size: 30,
                                  color: Colors.white,
                                )),
                            Positioned(
                              left: 20,
                              bottom: 22,
                              child: Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Center(
                                    child: DText(
                                  text: "5",
                                  color: Colors.white,
                                  size: 8,
                                  weight: FontWeight.w800,
                                  family: FontConstants.fontPoppins,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
  }
}
