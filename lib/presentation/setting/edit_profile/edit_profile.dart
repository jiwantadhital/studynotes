// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/logic/auth/editProfile/bloc/editprofile_bloc.dart';
import 'package:studynotes/presentation/auth_pages/auth_widgets/auth_widgets.dart';
import 'package:studynotes/presentation/extra_widgets/extra_widgets.dart';
import 'package:studynotes/resources/colors.dart';
import 'package:studynotes/resources/constants.dart';
import 'package:studynotes/resources/fonts.dart';

import '../../home_pages/widgets/home_page_widgets.dart';

class EditProfile extends StatefulWidget {
  String? image;
  String phone;
  String college;
  String sem;
   EditProfile({
    Key? key,
    required this.image,
    required this.phone,
    required this.college,
    required this.sem,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
  String photo="";
  String phone="";
  String sem="";
  String img = UserSimplePreferences.getGooglePhoto()??"";
  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      final imageData = imageTemp.readAsBytesSync();
      String base64Image =  base64Encode(imageData);
      setState((){
        this.image = imageTemp;
        img = base64Image; 
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  var nameController =
      TextEditingController(text: UserSimplePreferences.getUsername() ?? "");
  var phoneController = TextEditingController();
  var collegeDrop = SingleValueDropDownController();
  var semesterDrop = SingleValueDropDownController();

getAllData(){
  phoneController = TextEditingController(text: widget.phone);
 img = (widget.image??UserSimplePreferences.getGooglePhoto())!;
}

@override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          // Status bar color
          statusBarColor: ColorManager.primaryColor,

          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        backgroundColor: ColorManager.primaryColor,
        title: Center(
          child: DText(
            text: "Edit Profile",
            color: ColorManager.textColorWhite,
            weight: FontWeightManager.semibold,
            size: FontSize.s20,
            family: FontConstants.fontNunito,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.35,
                width: double.maxFinite,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    img != null
                        ? Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 7, color: Colors.white),
                                image: DecorationImage(
                                    image: MemoryImage(base64Decode(img)), fit: BoxFit.cover)),
                          )
                        : Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(width: 7, color: Colors.white),
                                image: DecorationImage(
                                    image:MemoryImage(base64Decode(imageAll)),
                                    fit: BoxFit.cover)),
                          ),
                    Positioned(
                      top: 60,
                      left: MediaQuery.of(context).size.width * 0.53,
                      child: GestureDetector(
                        onTap: () {
                          pickImage();
                          setState(() {
                          });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorManager.primaryColor),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              AuthTextBox(
                labelText: "UserName",
                controller: nameController,
              ),
              const SizedBox(
                height: 15,
              ),
              AuthTextBox(
                labelText: "Phone Number",
                controller: phoneController,
              ),
              const SizedBox(
                height: 15,
              ),
              DropField(
                singleValueDropDownController: collegeDrop,
                enableSearch: true,
                searchHimt: "Search for your college here",
                dropCount: 6,
                dropHint: 'Select Your College',
                dropList: const [
                  DropDownValueModel(name: "Orchid", value: 1),
                  DropDownValueModel(name: "Kist", value: 2),
                  DropDownValueModel(name: "Themes", value: 3),
                  DropDownValueModel(name: "Islington", value: 4),
                  DropDownValueModel(name: "Sankhar Dev", value: 5),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              DropField(
                singleValueDropDownController: semesterDrop,
                dropHint: "Select Semester",
                dropCount: 6,
                dropList: const [
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
              const SizedBox(
                height: 25,
              ),
              BlocConsumer<EditprofileBloc, EditprofileState>(
                listener: (context, state) {
                  if(state is EditProfileLoading){
                    print("Hello");
                    DialogBox().dialogbox(context);
                  }
                  if(state is EditProfileEdited){
                    Navigator.pop(context);
 ScaffoldMessenger.of(context).showSnackBar(
                                    ShowSnackBar().snack(
                                        "Profile Edited", ColorManager.primaryColor));
                                                  Navigator.pop(context);
                  }
                  if(state is EditProfileError){
 ScaffoldMessenger.of(context).showSnackBar(
                                    ShowSnackBar().snack(
                                        "Something went wrong", Colors.red));
                                                            Navigator.pop(context);
                  }
                },
                builder: (context, state) {
                  return AuthButton(
                    text: "Save",
                    tap: () {
                      context.read<EditprofileBloc>().add(EditingEvent(
                          name: nameController.text,
                          phone: phoneController.text,
                          sem: semesterDrop.dropDownValue!.value.toString(),
                          image: img
                          ));
                    },
                  );
                },
              )
            ],
          ),
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
        searchDecoration: InputDecoration(
            hintStyle: TextStyle(color: ColorManager.primaryColor),
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
                borderSide:
                    BorderSide(width: 2, color: ColorManager.primaryColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: ColorManager.primaryColor))),
        dropDownItemCount: dropCount,
        dropDownList: dropList);
  }
}
