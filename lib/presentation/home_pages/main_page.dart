import 'dart:async';

import 'package:animations/animations.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/allsubjects/bloc/allsubject_bloc.dart';
import 'package:studynotes/logic/auth/getProfile/bloc/profile_bloc.dart';
import 'package:studynotes/logic/news/bloc/news_bloc.dart';
import 'package:studynotes/logic/notes/chapters/bloc/chapter_bloc.dart';
import 'package:studynotes/logic/notes/subjects/bloc/subjects_bloc.dart';
import 'package:studynotes/logic/notices/bloc/notices_bloc.dart';
import 'package:studynotes/notification/local_notification.dart';
import 'package:studynotes/presentation/home_pages/news_section/news_details.dart';
import 'package:studynotes/presentation/home_pages/news_section/page/news_page.dart';
import 'package:studynotes/presentation/home_pages/parts/header.dart';
import 'package:studynotes/presentation/home_pages/parts/open_search_page.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/presentation/notification/notice_details.dart';
import 'package:studynotes/presentation/notification/notifications.dart';
import 'package:studynotes/presentation/subject_details/notes/notes.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

_notices(size) {
  String text = "The Result of 4th sem has been recently published by..";
  return BlocConsumer<NoticesBloc, NoticesState>(
      builder: (context, state) {
        if (state is NoticesLoading) {
          return const NoticeLoadError();
        }
        if (state is NoticesGot) {
          return SizedBox(
            height: 140,
            child: ListView.builder(
                padding: const EdgeInsets.only(top: 5),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.noticeModel.isEmpty?0: 3,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      state.noticeModel[index].description == null
                          ? showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) {
                                return Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.9,
                                          decoration: BoxDecoration(
                                              color: ColorManager.primaryColor,
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight:
                                                      Radius.circular(10))),
                                          child: Center(
                                              child: DText(
                                                  color: ColorManager
                                                      .textColorWhite,
                                                  text: "Notice",
                                                  weight:
                                                      FontWeightManager.bold,
                                                  family:
                                                      FontConstants.fontPoppins,
                                                  size: FontSize.s16)),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.28,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: DText(
                                                lines: 9,
                                                color:
                                                    ColorManager.textColorBlack,
                                                text: state.noticeModel[index]
                                                        .shortDescription ??
                                                    "",
                                                weight: FontWeightManager.light,
                                                family:
                                                    FontConstants.fontPoppins,
                                                size: FontSize.s14),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Ok"))
                                      ],
                                    ),
                                  ),
                                );
                              })
                          : Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return NoticeDetails(
                              datas:  state.noticeModel[index].description!,
                              );
                            }));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      margin: const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                      height: 40,
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: DText(
                              lines: 1,
                              color: ColorManager.textColorWhite,
                              text: state.noticeModel[index].title??text,
                              weight: FontWeightManager.light,
                              family: FontConstants.fontNoto,
                              size: FontSize.s12),
                        ),
                      ),
                    ),
                  );
                }),
          );
        }
        if (state is NoticesError) {
        return const NoticeLoadError();
        }
        return const NoticeLoadError();
      },
      listener: (context, state) {});
}

class NoticeLoadError extends StatelessWidget {
  const NoticeLoadError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      width: double.maxFinite,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 5,
            ),
            height: 40,
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.grey[200]),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 5,
            ),
            height: 40,
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.grey[200]),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            margin: const EdgeInsets.only(
              left: 15,
              right: 15,
              bottom: 5,
            ),
            height: 40,
            width: double.maxFinite,
            decoration: BoxDecoration(color: Colors.grey[200]),
          ),
        ],
      ),
    );
  }
}

//continue reading
_continueReading(size) {
  List<String> continueRead = UserSimplePreferences.getContinue()??[];
  return BlocBuilder<AllsubjectBloc, AllsubjectState>(
    builder: (context, state) {
      if(state is AllsubjectLoading){
       return ContinueLoadErrr(size: size,);
      }
      if(state is AllsubjectError){
         return ContinueLoadErrr(size: size,);
      }
      if(state is AllsubjectGot){
        List data = state.allSubjectModel.where((element) => continueRead.contains(element.id.toString())).toList();
        return SizedBox(
        height: 110,
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount:state.allSubjectModel.isEmpty?0: data.isEmpty?4: data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.read<ChapterBloc>().add(ChapterGettingEvent(id: data.isNotEmpty? data[index].id:state.allSubjectModel[index].id));
                        Navigator.push(context,
                                 MaterialPageRoute(builder: (context){
                               return Notes(id: data.isNotEmpty? data[index].id:state.allSubjectModel[index].id,);
                                 })
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(right: 10, left: 10),
                  width: size.width * 0.65,
                  height: 100,
                  decoration: BoxDecoration(
                    color: index.isEven
                        ? ColorManager.boxDarkGreen
                        : ColorManager.boxGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        child: DText(
                          color: ColorManager.textColorWhite,
                          text:data.isEmpty?state.allSubjectModel[index].title :data[index].title??"",
                          family: FontConstants.fontNunito,
                          weight: FontWeightManager.extrabold,
                          size: FontSize.s18,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DText(
                          color: ColorManager.textColorWhite,
                          text:data.isEmpty?state.allSubjectModel[index].title : data[index].semester.name,
                          weight: FontWeightManager.semibold,
                          family: FontConstants.fontNunito,
                          size: FontSize.s13)
                    ],
                  ),
                ),
              );
            }),
      );
      }
      return Container();
    },
  );
}

class ContinueLoadErrr extends StatelessWidget {
  var size;
   ContinueLoadErrr({
    super.key,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
           shrinkWrap: true,
           scrollDirection: Axis.horizontal,
           itemCount: 4,
           itemBuilder: (context, index) {
             return Container(
               padding: const EdgeInsets.all(10),
               margin: const EdgeInsets.only(right: 10, left: 10),
               width: size.width * 0.65,
               height: 100,
               decoration: BoxDecoration(
                 color: Colors.grey[200],
                 borderRadius: BorderRadius.circular(10),
               ),
           
             );
           }),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
   final bool _slowAnimations = false;
    final ContainerTransitionType _transitionType = ContainerTransitionType.fade;
  String token = "";
  ScrollController scrollController = ScrollController();
  double round = 20;

  @override
  void initState() {
    FirebaseMessaging.instance.getToken().then((value) {
      token = value.toString();
    });
    // scrollController
    //   ..addListener(() {
    //     _appBarCollapsed ? round = 0 : round = 20;
    //     setState(() {});
    //   });
    super.initState();
  FirebaseMessaging.instance.subscribeToTopic("all");
    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
                localnotice.value = 0;

        print("FirebaseMessaging.instance.getInitialMessage");

        if (message != null) {
          print("New Notification");
          if (message.notification!.body != null) {
            //   Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //       builder: (context) => Notifications()),
            // );
          }
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
      (message) {
        UserSimplePreferences.setNotices(0);
        localnotice.value = 0;
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          LocalNotificationService.createanddisplaynotification(message);
        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
      (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");

        if (message.notification != null) {
          print("FirebaseMessaging.onMessageOpenedApp.listen");
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );
  }

 

  @override
  Widget build(BuildContext context) {
        context.read<SubjectsBloc>().add(SubjectGettingEvent(id: 1));
        context.read<ProfileBloc>().add(GetProfileEvent());
    var size = MediaQuery.of(context).size;
    print(size.width);
    return Scaffold(
      backgroundColor: UserSimplePreferences.getDark()==true?Colors.black:Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: 65,
        title:  Top(size: size),
      ),
      body:
      NotificationListener<OverscrollIndicatorNotification>(
    onNotification: (OverscrollIndicatorNotification overscroll) {
    overscroll.disallowIndicator();
    return false;
    },
      child: RefreshIndicator(
          displacement: 250,
  backgroundColor: Colors.white,
  color: ColorManager.primaryColor,
  strokeWidth: 3,
  triggerMode: RefreshIndicatorTriggerMode.onEdge,
  onRefresh: () async {
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      context.read<AllsubjectBloc>().add(AllSubjectGettingEvent());
      context.read<NoticesBloc>().add(NoticeGetEvent());
      context.read<NewsBloc>().add(NewsGetEvent());
    });
  },
        child: SingleChildScrollView(   
          
          physics: const ClampingScrollPhysics(),      
          child:  Column(
              children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      height: 70,
                      width: size.width,
                      color: ColorManager.primaryColor,
                      child:  OpenContainer(
                transitionDuration: const Duration(milliseconds: 500),
                transitionType: _transitionType,
                closedBuilder: (BuildContext _, VoidCallback openContainer){
                  return  Stack(
                alignment: Alignment.centerRight,
                children: [
                 
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          const Icon(Icons.search,color: Colors.grey,),
                          const SizedBox(width: 10,),
                          DText(color: Colors.grey, text: "Search all subjects", weight: FontWeightManager.medium, family: FontConstants.fontNunito, size: FontSize.s12)
                        ],
                      ),
                  ),
                  Positioned(
                    right: 10,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Center(child: Icon(Icons.menu,color: Colors.white,),),
                    ),
                    ),
                ],
              );
                },
                 openBuilder: (BuildContext _, VoidCallback __){
                      return const OpenSearchPage();
                     }
                ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Topics(
                      color: UserSimplePreferences.getDark()==true?Colors.white:Colors.black,
                      text: "Continue reading",
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    _continueReading(size),
                    const SizedBox(
                      height: 10,
                    ),
                    Topics(
                       color: UserSimplePreferences.getDark()==true?Colors.white:Colors.black,
                      text: "Recent Notices",
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const Notifications();
                        }));
                      },
                    ),
                    // SizedBox(height: 5,),
                    _notices(size),
                    const SizedBox(
                      height: 10,
                    ),
                    Topics(
                      color: UserSimplePreferences.getDark()==true?Colors.white:Colors.black,
                      text: "Latest News",
                     onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return const NewsPage();
                        }));
                      },
                    ),               
                    const SizedBox(
                      height: 5,
                    ),
                    BlocConsumer<NewsBloc, NewsState>(
                        builder: ((context, state) {
                          if (state is NewsLoading) {
                            return Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(
                                      left: 15, right: 15, top: 10, bottom: 10),
                                  height: 120,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Loading(size: size),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Loading(size: size)
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 15, right: 15),
                                  height: 120,
                                  width: double.maxFinite,
                                  child: Row(
                                    children: [
                                      Loading(size: size),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Loading(size: size)
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                          if (state is NewsGot) {
                            return Container(
                              child: GridView.builder(
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio:
                                        size.width < 370 ? 4 / 3.7 : 4 / 3.5,
                                  ),
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) {
                                          return NewsDetails(
                                            data: state.newsModel[index].description.toString(),
                                            image: state.newsModel[index].image.toString(),
                                            title: state.newsModel[index].title.toString(),
                                            index: index,
                                          );
                                        }));
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.all(10),
                                        child: Column(
                                          children: [
                                            Container(
                                              // margin: EdgeInsets.only(left: 5,right: 5),
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      "${ApiClass.local}uploads/images/news/${state
                                                        .newsModel[index].image
                                                        .toString()}"
                                                    ),
                                                    fit: BoxFit.cover,
                                                  )),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5.0),
                                              child: DText(
                                                  lines: 2,
                                                  color: UserSimplePreferences.getDark()==true?Colors.white:Colors.black,
                                                  text: state.newsModel[index].title
                                                      .toString(),
                                                  weight: FontWeightManager.regular,
                                                  family: FontConstants.fontNoto,
                                                  size: FontSize.s11),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            );
                          }
                          if (state is NewsError) {
                            print(state.message);
                            return const Center(child: Text("Something went wrong"));
                          }
                          return const Text("error");
                        }),
                        listener: (context, state) {}),
                    const SizedBox(
                      height: 60,
                    )
                  
                
              ],
            ),
          
        ),
      ),
    )
    );
  }
}


class Loading extends StatelessWidget {
  const Loading({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: size.width * 0.44,
      child: Column(
        children: [
          Container(
            height: 90,
            width: size.width * 0.43,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 20,
            width: size.width * 0.43,
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10)),
          )
        ],
      ),
    );
  }
}
