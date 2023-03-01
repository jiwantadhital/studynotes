import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/logic/news/bloc/news_bloc.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

class NewsDetails extends StatefulWidget {
  int index;
   NewsDetails({super.key, required this.index});

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
   final news = context.read<NewsBloc>().newsController.newsModel[widget.index];
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(child: Container(
                    height: 260,
                    decoration: BoxDecoration(
                      color: ColorManager.primaryColor,
                      image: DecorationImage(image: NetworkImage(news.image.toString()),fit: BoxFit.cover)
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
                      image: DecorationImage(image: NetworkImage(news.image.toString()),fit: BoxFit.cover)
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
                          text: news.title??"", weight: FontWeightManager.extrabold,
                          family: FontConstants.fontPoppins, size: FontSize.s24),
                          SizedBox(height: 10,),
                          DText(color: dark==true? ColorManager.textColorWhite.withOpacity(0.4):ColorManager.textColorBlack.withOpacity(0.7),
                          text: news.desc??"", weight: FontWeightManager.regular,
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