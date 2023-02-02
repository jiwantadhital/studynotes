
import 'package:flutter/material.dart';
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
    Container(),
    Container(),
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
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 61,
        child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: ColorManager.primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
            )
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
            unselectedLabelStyle: TextStyle(
              color: ColorManager.boxBlue
            ),
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: onTapNav,
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.transparent
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category",
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
                ),
                BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: "Setting",
                ),
            ],
            ),
        ),
      ),
    );
  }
}