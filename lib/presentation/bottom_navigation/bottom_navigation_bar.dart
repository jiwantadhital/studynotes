
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:studynotes/presentation/categories/categories.dart';
import 'package:studynotes/presentation/colleges/colleges.dart';
import 'package:studynotes/presentation/home_pages/main_page.dart';
import 'package:studynotes/resources/colors.dart';


class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage> {
  int _selectedIndex = 0;
  List pages = [
    MainPage(),
    Categories(),
    Colleges(),
    Container(),
  ];
  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[_selectedIndex],
      bottomSheet: CurvedNavigationBar(
        index: 0,
        height: 60,
          backgroundColor: Colors.transparent,
          color: ColorManager.primaryColor,
          onTap: onTapNav,
          items: <Widget>[
            Icon(Icons.home,color: Colors.white,),
            Icon(Icons.category,color: Colors.white),
            Icon(Icons.school,color: Colors.white),
            Icon(Icons.settings,color: Colors.white),
          ]
          ),

    );
  }
}