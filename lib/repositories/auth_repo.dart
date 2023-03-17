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

//google
Future<http.Response> googleRepo(api, token) async{
final body = {
    "token" : token,
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
    print(res.statusCode);
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

//edit profile
Future<http.Response> editProfileRepo(api,name,phone,sem,image) async{
final body = {
   "name" : name,
    "phone" : phone,
    "sem_id" : sem,
    "image" : image
  }; 
  print(sem);
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