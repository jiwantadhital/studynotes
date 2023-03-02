import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:studynotes/resources/constants.dart';

class AuthRepo{

Future<http.Response> loginRepo(api, email, password) async{
final body = {
    "email" : email,
    "password" : password
  };
  var res =await http.post(Uri.parse("${ApiClass.mainApi}${api}"),
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

}