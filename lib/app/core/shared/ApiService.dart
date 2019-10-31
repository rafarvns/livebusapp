import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiConnector {
  static const _apiPath = "http://10.0.2.2:8080/api/";
  String _ref = "";

  ApiConnector(this._ref);

  dynamic get(String url) async {
    final response = await http.get(_apiPath + url);
    _checkHttpStatusCode(response.statusCode, url);
    return json.decode(response.body);
  }

  void _checkHttpStatusCode(int statusCode, String url){
    if(statusCode != 200){
      switch(statusCode){
        case 404:
          throw Exception('API: $_ref$statusCode, Not Found!\nError on getting from api: [$url]');
        default:
          throw Exception('API: $_ref$statusCode, Unknow Error!\nError on getting from api: [$url]');
      }
    }
    print('API: $_ref$statusCode, OK!\nSuccess on getting from api: [$url]');
  }
}