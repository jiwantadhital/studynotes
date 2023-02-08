import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  ScrollController scrollController = ScrollController();
  bool dark = false;
  bool collapsed = true;
   double round = 20;
  @override
  void initState() {
    scrollController..addListener(() { 
      _appBarCollapsed ? round =0:round=20;
      _darkCollapsed ? collapsed=false:collapsed=true;
      setState(() {
        
      });
    });
    super.initState();
  }

 bool get _appBarCollapsed{
  return scrollController.hasClients && scrollController.offset > (70-kToolbarHeight);
  }
  bool get _darkCollapsed{
  return scrollController.hasClients && scrollController.offset > (190-kToolbarHeight);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(child: Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      image: DecorationImage(image: NetworkImage("https://www.rmit.edu.au/content/dam/rmit/multimedia/video/youtube-images/marketing/online/flexible-study-02-1280x732.jpg"),fit: BoxFit.cover)
                    ),
                  ),),
          NestedScrollView(
            controller: scrollController,
                headerSliverBuilder:
                    (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
              SliverAppBar(
                actions: [
                  Padding(padding: EdgeInsets.only(right: 20),
                  child: collapsed==false? CupertinoSwitch(value: dark, onChanged: (val){
                    dark= val;
                    setState(() {
                      
                    });
                  },activeColor: Colors.black,thumbColor: dark?Colors.white:Colors.black,
                  trackColor: Colors.white,
                  ):Container(),
                  )
                ],
                systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent, 
         statusBarIconBrightness: Brightness.light, 
          statusBarBrightness: Brightness.light,   ),
                centerTitle: true,
                floating: false,
                pinned: true,
                backgroundColor: ColorManager.primaryColor,
                leading: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                  margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                            color: ColorManager.primaryColor.withOpacity(0.6),
                            shape: BoxShape.circle
                      ),
                      child: Icon(Icons.arrow_back,color: Colors.white,size: 20,),
                    ),
                ),
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    // height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://www.rmit.edu.au/content/dam/rmit/multimedia/video/youtube-images/marketing/online/flexible-study-02-1280x732.jpg"),fit: BoxFit.cover)
                    ),
                  ),
                ),
              
              )
            
            ];
                    },
                    body: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color:dark==true? Colors.grey[600]:Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(round),
                          topRight: Radius.circular(round)
                        )
                      ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(height: 10,),
                          DText(color:dark==true? ColorManager.textColorWhite:ColorManager.textColorBlack,
                          text: "Why are student preferring online study ?", weight: FontWeightManager.extrabold,
                          family: FontConstants.fontPoppins, size: FontSize.s24),
                          SizedBox(height: 10,),
                          DText(color: dark==true? ColorManager.textColorWhite.withOpacity(0.4):ColorManager.textColorBlack.withOpacity(0.7),
                          text: "Online education enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda. As a result, using an online educational platform allows for a better balance of work and studies, so there's no need to give anything up. Online education enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda. \n As a result, using an online educational platform allows for a better balance of work and studies, so there's no need to give anything up. Online education enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda.\n As a result, using an online educational platform allows for a better balance of work and studies, so there's no need to give anything up. Online education enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda. As a result, using an online educational platform allows for a better balance of work and studies, so there's no need to give anything up. Online education enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda. As a result, using an online educational platform allows for a better balance of work and studies, so there's no need to give anything up. \n Online education enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda. As a result, using an online educational platform allows for a better balance of work and studies, so there's no need to give anything up.Online education enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda. As a result, using an online educational platform allows for a better balance of work and studies, so there's no need to give anything up. Online education enables the teacher and the student to set their own learning pace, and there's the added flexibility of setting a schedule that fits everyone's agenda. As a result, using an online educational platform allows for a better balance of work and studies, so there's no need to give anything up", weight: FontWeightManager.regular,
                          family: FontConstants.fontNoto, size: FontSize.s16),
                        ],
                      ),
                    ),
                    ),
          ),
        ],
      ),
    );
  }
}