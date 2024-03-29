import 'dart:async';
import 'package:flutter/material.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/presentation/auth_pages/social_login.dart';
import 'package:studynotes/presentation/splash/for_logged_user.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin{


  bool up = false;

  late Animation<double> animation;
  late AnimationController controller;
  Timer? _timer;

  fortrue(){
    up = true;
    setState(() {
      
    });
  }
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
    controller = AnimationController(vsync: this, duration: const Duration(seconds: 1),)..forward().whenComplete(() {
     Timer(const Duration(seconds: 1), fortrue);
    });
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    _timer = Timer(const Duration(seconds: 3), _goNext);
  }
  _goNext(){
    print(UserSimplePreferences.userLoggedIn());
     print(UserSimplePreferences.getVerified());
  if(UserSimplePreferences.getVerified()==false){
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return const SocialLogin();
   }));
  }
  else{
   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
    return UserSimplePreferences.userLoggedIn()==true? const ForLogged():const SocialLogin();
   }));
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              AnimatedPositioned(
                duration: const Duration(seconds: 1),
                top:up==false? MediaQuery.of(context).size.height*0.35:10,
                child: ScaleTransition(
                  scale: animation,
                  child: RotationTransition(
                    turns: Tween(begin: 0.0, end: 1.0).animate(controller),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height*0.25,
                      child: const Image(
                        image: AssetImage(
                          "assets/images/splashi.png"
                          ),
                          ),
                    ),
                  ),
                ),
              ),
                      const SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}