import 'dart:convert';
import 'dart:io';
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/domain/user/UserRequest.dart';
import 'package:livebus/app/core/domain/user/database/UserDatabase.dart';
import 'package:livebus/app/core/shared/api/ApiService.dart';
import 'package:livebus/app/core/shared/container/Repository.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_location/flutter_background_location.dart';
import 'package:livebus/app/core/values/colors.dart';
import 'package:livebus/app/views/pages/home/home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'app/core/domain/user/User.dart';

void main() async {
  Repository repository = Repository();
  await repository.initRepository();

  _createIdUser();

  runApp(MaterialApp(
    title: "Live Bus - App",
    theme: ThemeData(hintColor: primaryColor, primaryColor: lightColor),
    home: Container(child: Home()),
  ));
}

void _createIdUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getInt('userId')==null)
      prefs.setInt('userId', 9999);
}
