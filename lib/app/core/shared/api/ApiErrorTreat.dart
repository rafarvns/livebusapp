

import 'dart:developer';

import 'package:livebus/app/core/shared/error/ErrorException.dart';
import 'package:livebus/app/core/shared/error/ErrorType.dart';
import 'package:livebus/app/core/values/colors.dart';

class ApiErrorTreat {

  int _statusCode;
  String _url;

  ApiErrorTreat(this._statusCode, this._url);

  void checkErrors(){
    if (_statusCode != 200) {
      switch (_statusCode) {
        case 404:
          ErrorException(
            '$_statusCode, Not Found!\nError on getting from api: [$_url]',
            ErrorType.API,
            warningColor,
            "Erro ao buscar dados na API!")
            .trow();
          break;
        default:
          ErrorException(
            '$_statusCode, Unknow Error!\nError on getting from api: [$_url]',
            ErrorType.API,
            dangerColor,
            "Erro desconhecido ao buscar a API!")
            .trow();
          break;
      }
    }
    log('API: $_statusCode, OK!\nSuccess on getting from api: [$_url]');
  }


}