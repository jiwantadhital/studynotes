import 'package:flutter/material.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/resources/colors.dart';

import '../../resources/fonts.dart';
import '../home_pages/widgets/home_page_widgets.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  bool hide1 = true;
  bool hide2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: DText(text: "Create Your Password",color: ColorManager.textColorWhite,weight: FontWeightManager.semibold,size: FontSize.s20, family: FontConstants.fontNunito,),),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            AuthTextBox(labelText: "Password",
            hide: hide1,
            icon: hide1==true?Icons.remove_red_eye: Icons.remove_red_eye_outlined,
            tap: (){
              hide1 == true?hide1 = false:hide1 = true;
              setState(() {
                
              });
            },
            ),
            const SizedBox(height: 20,),
            AuthTextBox(labelText: "Confirm Password",
            hide: hide2,
            icon:hide2==true?Icons.remove_red_eye: Icons.remove_red_eye_outlined,
            tap: (){
              hide2 == true?hide2 = false:hide2 = true;
              setState(() {
                
              });
            },
            ),
            const SizedBox(height: 40,),
            AuthButton(text: "Save")
          ],
        ),
      ),
    );
  }
}