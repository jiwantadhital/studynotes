import 'package:http/http.dart' as http;
import 'package:studynotes/resources/constants.dart';

class GetRepo{

Future<http.Response> getRepo(api) async{
  var response = await http.get(Uri.parse("${ApiClass.local}$api"),
  );
  if(response.statusCode==200){
    return response;
  }
  else{
    throw Exception(response.reasonPhrase);
  }
}

Future<http.Response> getRepository(api) async{
  var response = await http.get(Uri.parse("${ApiClass.local}$api")
  );
  if(response.statusCode==200){
    // print(response.body);
    return response;
  }
  else{
    // print(response.statusCode);
    throw Exception(response.reasonPhrase);
  }
}

}