import 'dart:convert';

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

var response = await authRepo.registerRepo("${ApiClass.registerApi}", email, password, phone, name);
    var data = jsonDecode(response.body);
    registerModel = RegisterModel.fromJson(data);
    print(response.body);
    return registerModel;
}
}