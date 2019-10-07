import 'package:flutter/material.dart';
import 'package:livebus/app/core/values/colors.dart';
import 'package:livebus/app/views/pages/home/home.dart';

void main(){
  runApp(MaterialApp(
    title: "Live Bus - App",
    theme: ThemeData(hintColor: primaryColor, primaryColor: lightColor),
    home: Home(),
  ));
}