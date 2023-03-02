import 'dart:convert';

import 'package:studynotes/models/auth_model.dart';
import 'package:studynotes/repositories/auth_repo.dart';
import 'package:studynotes/resources/constants.dart';

class AuthController{
AuthRepo authRepo = AuthRepo();
var loginModel;
Future<LoginModel> login(email, password)async{

var response = await authRepo.loginRepo("${ApiClass.loginApi}", email, password);
    var data = jsonDecode(response.body);
    loginModel = LoginModel.fromJson(data);
    print(response.body);
    return loginModel;
}
  
}