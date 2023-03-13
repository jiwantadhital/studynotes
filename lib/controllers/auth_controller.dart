import 'dart:convert';

import 'package:studynotes/local_databases/sharedpreferences/shared_pref.dart';
import 'package:studynotes/models/auth_model.dart';
import 'package:studynotes/repositories/auth_repo.dart';
import 'package:studynotes/resources/constants.dart';

class AuthController{
AuthRepo authRepo = AuthRepo();

//login
var loginModel;
Future<LoginModel> login(email, password)async{

var response = await authRepo.loginRepo("${ApiClass.loginApi}", email, password);
    var data = jsonDecode(response.body);
    loginModel = LoginModel.fromJson(data);
    print(response.body);
    return loginModel;
}


//register
var registerModel;

  Future<RegisterModel> register(email, password, phone, name)async{

var response = await authRepo.registerRepo("${ApiClass.registerApi}", name, email, password, phone);
    var data = jsonDecode(response.body);
    registerModel = RegisterModel.fromJson(data);
    print(response.body);
    return registerModel;
}
//editProfile
var editProfileModel;

  Future<EditProfileModel> editProfile(name, phone, sem,image)async{

var response = await authRepo.editProfileRepo("${ApiClass.editProfileApi}/${UserSimplePreferences.getUserID()}", name, phone, sem,image);
    var data = jsonDecode(response.body);
    editProfileModel = EditProfileModel.fromJson(data);
    print(response.body);
    return editProfileModel;
}


//otp
var otpModel;

  Future<OtpModel> otp(num)async{

var response = await authRepo.otpRepo("${ApiClass.otpApi}/${UserSimplePreferences.getUserID()}", num);
    var data = jsonDecode(response.body);
    otpModel = OtpModel.fromJson(data);
    print(response.body);
    return otpModel;
}
}