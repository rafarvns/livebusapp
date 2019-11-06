import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:livebus/app/core/shared/error/ErrorException.dart';
import 'package:livebus/app/core/shared/error/ErrorType.dart';
import 'package:livebus/app/core/shared/message/ToastyMessage.dart';
import 'package:livebus/app/core/values/colors.dart';

class ApiConnector {
//  static const _apiPath = "http://10.0.2.2:8080/api/";
  static const _apiPath = "http://192.168.1.99:8080/api/";
  String _ref = "";

  ApiConnector(this._ref);

  dynamic get(String url) async {
    final response = await http.get(_apiPath + url);
    _checkHttpStatusCode(response.statusCode, url);
    return json.decode(response.body);
  }

  void _checkHttpStatusCode(int statusCode, String url) {
    if (statusCode != 200) {
      switch (statusCode) {
        case 404:
          ErrorException(
                  '$_ref$statusCode, Not Found!\nError on getting from api: [$url]',
                  ErrorType.API,
                  warningColor,
                  "Erro ao buscar dados na API!")
              .trow();
          break;
        default:
          ErrorException(
                  '$_ref$statusCode, Unknow Error!\nError on getting from api: [$url]',
                  ErrorType.API,
                  dangerColor,
                  "Erro desconhecido ao buscar a API!")
              .trow();
          break;
      }
    }
    log('API: $_ref$statusCode, OK!\nSuccess on getting from api: [$url]');
  }
}
