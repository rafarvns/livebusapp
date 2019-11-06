

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToastyMessage{

  String _message;
  Color _colorToast;

  ToastyMessage(this._message, this._colorToast);

  show(){
    Fluttertoast.showToast(
      msg: _message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
      backgroundColor: _colorToast,
      textColor: Colors.white,
      fontSize: 16.0
    );
  }

}