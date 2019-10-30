
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';

class ApiConnector {

  static const _apiPath = "http://10.0.2.2:8080/api/";
  int _connectionStatus;

  Future<List<RouteDraw>> get(String url) async {
    final response = await http.get(_apiPath+url);
    if(response.statusCode == 200) {

      final parsed = json.decode(response.body);

      var a = (parsed["data"] as List).map<RouteDraw>((json) =>
        new RouteDraw.fromJson(json)).toList();
      return a;
    } else {
      throw Exception('Failed to load post');
    }
  }
  
}


