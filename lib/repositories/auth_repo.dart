import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:studynotes/resources/constants.dart';

class AuthRepo{

//login
Future<http.Response> loginRepo(api, email, password) async{
final body = {
    "email" : email,
    "password" : password
  };
  var res =await http.post(Uri.parse("${ApiClass.local}${api}"),
  headers: {
    "Content-Type": "application/json",
    "Accept" : "application/json"
  },
  body: jsonEncode(body)
  ).timeout(Duration(seconds: 10));
  if(res.statusCode==200){
    return res;
  }
  else{
   throw Exception(res.reasonPhrase);
  }

}

//register
Future<http.Response> registerRepo(api,name,email, password,phone,) async{
final body = {
    "email" : email,
    "password" : password,
    "name" : name,
    "phone" : phone
  };print(" $email");
  var res =await http.post(Uri.parse("${ApiClass.local}${api}"),
  headers: {
    "Content-Type": "application/json",
    "Accept" : "application/json"
  },
  body: jsonEncode(body)
  ).timeout(Duration(seconds: 10));
  if(res.statusCode==200){
    print("200");
    return res;
  }
  else{
    print(res.reasonPhrase);
   throw Exception(res.reasonPhrase);
  }

}


//otp
Future<http.Response> otpRepo(api,num) async{
final body = {
    "phone_verified" : num,
  };
  var res =await http.put(Uri.parse("${ApiClass.local}${api}"),
  headers: {
    "Content-Type": "application/json",
    "Accept" : "application/json"
  },
  body: jsonEncode(body)
  ).timeout(Duration(seconds: 10));
  if(res.statusCode==200){
    print("200");
    return res;
  }
  else{
    print(res.reasonPhrase);
   throw Exception(res.reasonPhrase);
  }

}

}