import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:livebus/app/core/shared/api/ApiErrorTreat.dart';
import 'package:livebus/app/core/shared/error/ErrorException.dart';
import 'package:livebus/app/core/shared/error/ErrorType.dart';
import 'package:livebus/app/core/shared/message/ToastyMessage.dart';
import 'package:livebus/app/core/values/colors.dart';

class ApiConnector {
//  static const _apiPath = "http://10.0.2.2:8080/api/";
//  static const _apiPath = "http://192.168.1.99:8080/api/";
  static const _apiPath = "https://livebusapi.herokuapp.com/api/";

  ApiConnector();

  dynamic get(String url) async {
    final response = await http.get(_apiPath + url);
    ApiErrorTreat(response.statusCode, url).checkErrors();
    return json.decode(response.body);
  }

  dynamic post(String url) async {
    final response = await http.post(_apiPath + url);
    ApiErrorTreat(response.statusCode, url).checkErrors();
    return json.decode(response.body);
  }

}
