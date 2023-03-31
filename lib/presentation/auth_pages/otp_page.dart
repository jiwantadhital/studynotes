import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/auth/otp/bloc/otp_bloc.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/presentation/bottom_navigation/bottom_navigation_bar.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/presentation/home_pages/widgets/home_page_widgets.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../resources/colors.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key});

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
      final _formKey2 = GlobalKey<FormState>();
  final _counterNotifier = ValueNotifier<int>(40);
  var otpController = TextEditingController();

bool active = true;
Timer? timer;

 deactive(){
  active = false;
  Timer _timer =  Timer(const Duration(seconds: 39), () {
    timer!.cancel();
      setState(() {
        active = true;
      });
    });
}
decrease(){
 timer= Timer.periodic(Duration(seconds: 1), (timer) {
        _counterNotifier.value--;
     });
}

@override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Center(child: DText(text: "Verify Phone Number",color: ColorManager.textColorWhite,weight: FontWeightManager.semibold,size: FontSize.s20, family: FontConstants.fontNunito,),),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey2,
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height*0.06,),
                  AuthTextBox(
                    controller: otpController,
                    validation: (val){
                      if(val != UserSimplePreferences.getOtp()){
                        print(UserSimplePreferences.getOtp());
                        return "Incorrect OTP";
                      }
                    },
                    labelText: "OTP",type: TextInputType.number,maxlength: 4,),
                  SizedBox(height: 40,),
                    BlocConsumer<OtpBloc,OtpState>(builder: (context,state){
                      return AuthButton(text: "Verify",
                    tap: (){
                      if(_formKey2.currentState!.validate()){
                        context.read<OtpBloc>()..add(OTPprocessEvent(
                               num: 1.toString(),
                                ));
                      }
                    },
                    );
                    }, listener: (context,state){
                      if(state is OtpLoading){
                        return DialogBox().dialogbox(context);
                      }
                      if(state is OtpDone){
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context){
                             return BottomBarPage();
                           }), (Route<dynamic> route) => false);
                      }
                      if(state is OtpError){
                        Navigator.pop(context);
                      }
                    }),
                    SizedBox(height: 20,),
                   active == true? Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              _counterNotifier.value = 40;
                              deactive();
                              decrease();
                            });
                          },
                          child: DText(color: ColorManager.primaryColor, text: "Resend OTP", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14)))):
                          Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                      child:  ValueListenableBuilder(
                            valueListenable: _counterNotifier,
                         builder: (context, value, _) {
                              return DText(color: Colors.grey, text: "Resend otp again in $value", weight: FontWeightManager.bold, family: FontConstants.fontNunito, size: FontSize.s14);
                         },
                           ),
                        )
                          )
            ],
          ),
        ),
      ),
    );
  }
}