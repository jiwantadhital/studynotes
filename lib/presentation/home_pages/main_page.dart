import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studynotes/presentation/home_pages/news_section/news_details.dart';
import 'package:studynotes/presentation/home_pages/parts/header.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';
_notices(size){
  String text = "The Result of 4th sem has been recently published by..";
  return Container(
            height: 140,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 5),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: (){
                    showDialog(
                      barrierDismissible: false,
                      context: context, builder: (context){
                      return Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.5,
                          width: MediaQuery.of(context).size.width*0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.1,
                                width: MediaQuery.of(context).size.width*0.9,
                                decoration: BoxDecoration(
                                  color: ColorManager.primaryColor,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)
                                  )
                                ),
                             child: Center(child: DText(color: ColorManager.textColorWhite, text: "Notice", weight: FontWeightManager.bold, family: FontConstants.fontPoppins, size: FontSize.s16)),

                              ),
                              SizedBox(height: 10,),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.28,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: DText(
                                      lines: 9,
                                      color: ColorManager.textColorBlack, text: "The resut of this semister was published by the BCA Result 2022 1st 2nd 3rd year (Part 1, 2, 3) Semester results can be checked from the official website of each university. All information about BCA Result 2022 will be available on our website. According to the information, soon the result of the examination will be released on the official website BCA Result 2022 1st 2nd 3rd year (Part 1, 2, 3) Semester results can be checked from the official website of each university. All information about BCA Result 2022 will be available on our website. According to the information, soon the result of the examination will be released on the official website", weight: FontWeightManager.light, family: FontConstants.fontPoppins, size: FontSize.s14),
                                  ),
                                ),
                                SizedBox(height: 10,),
                                ElevatedButton(onPressed: (){
                                  Navigator.pop(context);
                                }, child: Text("Ok"))
                            ],
                          ),
                        ),
                      );
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(left: 10,right: 10),
                    margin: EdgeInsets.only(left: 15,right: 15,bottom: 5),
                    height: 40,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      borderRadius: BorderRadius.circular(5)
                    ),
                    child: Center(
                      child: DText(
                        lines: 1,
                        color: ColorManager.textColorWhite,
                        text: text,
                        weight: FontWeightManager.light,
                        family: FontConstants.fontNoto,
                        size: FontSize.s12
                        ),
                    ),
                  ),
                );
            }),
          );
}

//continue reading
_continueReading(size){
  return Container(
            height: 110,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(right: 10,left: 10),
                  width: size.width*0.65,
                  height: 100,
                  decoration: BoxDecoration(
                    color: index.isEven?ColorManager.boxDarkGreen:ColorManager.boxGreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        child: DText(
                          color: ColorManager.textColorWhite,
                          text:index.isEven? "Software Engineering and Pilot":"Basic Computing in Math",
                          family: FontConstants.fontNunito,
                          weight: FontWeightManager.extrabold,
                          size: FontSize.s18,
                        ),
                      ),
                      SizedBox(height: 10,),
                      DText(
                        color: ColorManager.textColorWhite,
                        text: "Chapters: 12",
                        weight: FontWeightManager.semibold,
                        family: FontConstants.fontNunito,
                        size: FontSize.s13)
                    ],
                  ),
                );
            }),
          );
}




class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  ScrollController scrollController = ScrollController();
  double round = 20;
  @override
  void initState() {
    scrollController..addListener(() { 
      _appBarCollapsed ? round =0:round=20;
      setState(() {
        
      });
    });
    super.initState();
  }

 bool get _appBarCollapsed{
  return scrollController.hasClients && scrollController.offset > (140-kToolbarHeight);
  }


  @override
  Widget build(BuildContext context) {
        var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: ColorManager.primaryColor, 
    statusBarIconBrightness: Brightness.light, 
    statusBarBrightness: Brightness.light,   ),
            centerTitle: true,
            floating: false,
            pinned: true,
            backgroundColor: ColorManager.primaryColor,
            collapsedHeight: 70,
            expandedHeight: size.height*0.20,
          shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(round),bottomRight: Radius.circular(round)),
        ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(left: 10,right: 10),
                child: TopHeader(size: size),
              ),
              centerTitle: true,
              title: _appBarCollapsed? Container(
                margin: EdgeInsets.only(left: 10,right: 10),
                padding: EdgeInsets.only(top: 15),
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
                      border: Border.all(width: 2,color: Colors.white),
                      image: const DecorationImage(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsynwv-5qtogtOwJbIjaPFJUmHpzhxgqIAug&usqp=CAU"),fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 20,),
                  Padding(
                    padding: const EdgeInsets.all(0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        DText(
                          family: FontConstants.fontPoppins,
                          weight: FontWeightManager.bold,
                          size: FontSize.s16,
                          color: ColorManager.textColorWhite,
                          text: "Hello, User",
                          
                        ),
                        DText(
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
                      border: Border.all(width: 2,color: Colors.white),
                    ),
                    child: Stack(
                        alignment: Alignment.center,
                      children: [
                        const Icon(Icons.notifications,size: 30,color: Colors.white,),
                        Positioned(
                          left: 20,
                          bottom: 22,
                          child: Container(
                            height: 14,
                            width: 14,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(child: DText(text: "5",color: Colors.white,size: 8,weight: FontWeight.w800,family: FontConstants.fontPoppins,)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ):Container(),
      
            ),
          ),
        
          SliverList(delegate: SliverChildListDelegate(
            [
              SizedBox(height: 15,),
                    Topics(text: "Continue reading",),
                    SizedBox(height: 5,),
                    _continueReading(size),
                    SizedBox(height: 10,),
                    Topics(text: "Recent Notices"),
                    // SizedBox(height: 5,),
                    _notices(size),
                    SizedBox(height: 10,),
                    Topics(text: "Latest News"),
                    SizedBox(height: 5,),
                      Container(
                      child: GridView.builder(
                        padding: EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        childAspectRatio: 4/3.5,
                        ),
                        itemCount: 6,
                        itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return NewsDetails();
                            }));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  // margin: EdgeInsets.only(left: 5,right: 5),
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage("https://www.rmit.edu.au/content/dam/rmit/multimedia/video/youtube-images/marketing/online/flexible-study-02-1280x732.jpg"),fit: BoxFit.cover,
                                      )
                                  ),
                                  ),
                                  SizedBox(height: 5,),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: DText(
                                      color: ColorManager.textColorBlack,
                                      text: "Why are student preferring online study ?", 
                                      weight: FontWeightManager.regular, 
                                      family: FontConstants.fontNoto, 
                                      size: FontSize.s11
                                      ),
                                  )
                              ],
                            ),
                          ),
                        );
                        }),
                    ),
                    SizedBox(height: 60,)
            ]
          ),
          ),
        ],
      ),
    );
  }
}