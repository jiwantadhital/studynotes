
import 'dart:async';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:studynotes/presentation/categories/categories.dart';
import 'package:studynotes/presentation/colleges/colleges.dart';
import 'package:studynotes/presentation/home_pages/main_page.dart';
import 'package:studynotes/presentation/setting/settings.dart';
import 'package:studynotes/resources/colors.dart';


class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
static void setLocale(BuildContext context, bool open){
    _BottomBarPageState? state = context.findAncestorStateOfType<_BottomBarPageState>();
    state?.setLocale(open);
  }
}

class _BottomBarPageState extends State<BottomBarPage> {
  bool _open = false;
setLocale(bool open){
  setState(() {
    _open = open;
  });
}


  int _selectedIndex = 0;
  List pages = [
    MainPage(),
    Categories(),
    Colleges(),
    SettingPage(),
  ];
  void onTapNav(int index){
    setState(() {
      _selectedIndex = index;
      setState(() {
        
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return _open==false? Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[_selectedIndex],
      bottomSheet: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60,
          backgroundColor: Colors.transparent,
          color: Theme.of(context).primaryColor,
          onTap: onTapNav,
          items: <Widget>[
            Icon(Icons.home,color: Colors.white,),
            Icon(Icons.category,color: Colors.white),
            Icon(Icons.school,color: Colors.white),
            Icon(Icons.settings,color: Colors.white),
          ]
          ),

    ):
    Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        height: 60,
          backgroundColor: Colors.white,
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