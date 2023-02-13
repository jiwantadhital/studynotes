// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  var nameController = TextEditingController(text: UserSimplePreferences.getUsername()??"");
  var phoneController = TextEditingController();
  var collegeDrop = SingleValueDropDownController();
   var semesterDrop = SingleValueDropDownController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
    // Status bar color
    statusBarColor: ColorManager.primaryColor, 

    // Status bar brightness (optional)
    statusBarIconBrightness: Brightness.light, 
    statusBarBrightness: Brightness.light,   ),
  backgroundColor: ColorManager.primaryColor,
        title: Center(child: DText(text: "Edit Profile",color: ColorManager.textColorWhite,weight: FontWeightManager.semibold,size: FontSize.s20, family: FontConstants.fontNunito,),),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: [
            SizedBox(height: 20,),
            AuthTextBox(labelText: "UserName",
            controller: nameController, 
            ),
            SizedBox(height: 15,),
            AuthTextBox(labelText: "Phone Number",
            controller: phoneController,
            ),
            SizedBox(height: 15,),
            DropField(
              singleValueDropDownController: collegeDrop,
              enableSearch: true,
              searchHimt: "Search for your college here", dropCount: 6, dropHint: 'Select Your College', 
              dropList: const[
      DropDownValueModel(name: "Orchid", value: 1),
      DropDownValueModel(name: "Kist", value: 2),
      DropDownValueModel(name: "Themes", value: 3),
      DropDownValueModel(name: "Islington", value: 4),
      DropDownValueModel(name: "Sankhar Dev", value: 5),
      
    ],
            ),
            SizedBox(height: 15,),
             DropField(
              singleValueDropDownController: semesterDrop,
               dropHint: "Select Semester",
                dropCount: 6,
                 dropList: const[
              DropDownValueModel(name: "Sem 1", value: 1),
              DropDownValueModel(name: "Sem 2", value: 2),
              DropDownValueModel(name: "Sem 3", value: 3),
              DropDownValueModel(name: "Sem 4", value: 4),
              DropDownValueModel(name: "Sem 5", value: 5),
              DropDownValueModel(name: "Sem 6", value: 6),
              DropDownValueModel(name: "Sem 7", value: 7),
              DropDownValueModel(name: "Sem 8", value: 8),
            ],
                 ),
            SizedBox(height: 25,),
            AuthButton(text: "Save")
          ],
        ),
      ),
    );
  }
}

class DropField extends StatelessWidget {
  SingleValueDropDownController singleValueDropDownController;
bool enableSearch;
String? searchHimt;
String dropHint;
int dropCount;
List<DropDownValueModel> dropList;
   DropField({
    Key? key,
    required this.singleValueDropDownController,
   this.enableSearch = false,
     this.searchHimt,
    required this.dropHint,
    required this.dropCount,
    required this.dropList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropDownTextField(
      controller: singleValueDropDownController,
      enableSearch: enableSearch,
      searchDecoration:  InputDecoration(
        hintStyle: TextStyle(
          color: ColorManager.primaryColor
        ),
              hintText: searchHimt),
          validator: (value) {
            if (value == null) {
              return "Required field";
            } else {
              return null;
            }
          },
       textFieldDecoration: InputDecoration(
        hintText: dropHint,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 2,
            color: ColorManager.primaryColor
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: ColorManager.primaryColor
          )
        )
      ),
      dropDownItemCount: dropCount,
      dropDownList: dropList);
  }
}
