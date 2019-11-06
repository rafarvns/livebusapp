
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:livebus/app/core/shared/error/ErrorType.dart';

class ErrorException {
  String _api = "API_ERROR";
  String _database = "DATABASE_ERROR";
  String _message;
  ErrorType _errorType;
  Color _colorToast;
  String _toastyMessage;

  ErrorException(this._message, this._errorType, this._colorToast, this._toastyMessage);

  trow() {
    String message = getMessage();
    if(this._colorToast != null) _showToast();
    throw Exception(message);
  }

  String getMessage() {
    switch (_errorType) {
      case ErrorType.API:
        return _api + ": " + _message;
        break;
      case ErrorType.DATABASE:
        return _database + ": " + _message;
        break;
      default:
        return "UNKNOW_ERROR: " + _message;
        break;
    }
  }

  void _showToast() {
    Fluttertoast.showToast(
      msg: _toastyMessage,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: _colorToast,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }
}
