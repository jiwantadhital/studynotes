import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studynotes/presentation/auth_pages/auth_page.dart';
import 'package:studynotes/resources/colors.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin{


  

  late Animation<double> animation;
  late AnimationController controller;
  Timer? _timer;

  
  @override
  void initState() {
    super.initState();
    _startDelay();
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
  _startDelay(){
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2),)..forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    _timer = Timer(Duration(seconds: 4), _goNext);
  }
  _goNext(){
   Navigator.push(context, MaterialPageRoute(builder: (context){
    return AuthPage();
   }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: ScaleTransition(
        scale: animation,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: RotationTransition(
                turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                child: Container(
                  height: 200,
                  width: 200,
                  child: Image(
                    image: AssetImage(
                      "assets/images/splashi.png"
                      ),
                      ),
                ),
              ),
            ),
            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}