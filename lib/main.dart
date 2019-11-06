
import 'dart:convert';
import 'dart:io';
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/shared/api/ApiService.dart';
import 'package:livebus/app/core/shared/container/Repository.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_location/flutter_background_location.dart';
import 'package:livebus/app/core/values/colors.dart';
import 'package:livebus/app/views/pages/home/home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
//https://pub.dev/documentation/dryice/latest/dryice/dryice-library.html
Database _database;
String loca = "";

void main()async{
  Repository repository = Repository();
  repository.initRepository();

  FlutterBackgroundLocation.startLocationService();
  FlutterBackgroundLocation.getLocationUpdates((location) {
    updatePos(location);
  });

  runApp(MaterialApp(
    title: "Live Bus - App",
    theme: ThemeData(hintColor: primaryColor, primaryColor: lightColor),
    home: Container(
      child: Home()
    ),
  ));
}

void updatePos(location) {
//  location.latitude.toString() +", "+ location.longitude.toString()
}




//

//
//class DBProvider {
//  DBProvider._();
//  static final DBProvider db = DBProvider._();
//}
