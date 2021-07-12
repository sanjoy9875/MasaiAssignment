


import 'dart:convert';

import 'package:http/http.dart' as http;

import 'states.dart';

class HttpService{
 final String url = "https://api.covidtracking.com/v1/states/info.json";

  get https => null;

Future<List<States>> getStates()async{

  http.Response res = await https.get(Uri.parse(url));

  if(res.statusCode==200){
    List<dynamic> body = jsonDecode(res.body);
    List<States> states = body.map((dynamic item) => States.fromJson(item)).toList();
    return states;
  }
  else{
    throw 'cant get states';
  }
  }
}