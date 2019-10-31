
import 'dart:convert';
import 'dart:io';
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/shared/ApiService.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_location/flutter_background_location.dart';
import 'package:livebus/app/core/values/colors.dart';
import 'package:livebus/app/views/pages/home/home.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Database _database;
String loca = "";

void main()async{
//  Database dt = await database();
//  print("abriu!");
//  FlutterBackgroundLocation.startLocationService();
//  FlutterBackgroundLocation.getLocationUpdates((location) {
//    newPos(location);
//  });
  runApp(MaterialApp(
    title: "Live Bus - App",
    theme: ThemeData(hintColor: primaryColor, primaryColor: lightColor),
    home: Container(
      child: Home()
    ),
  ));
}
//
//
//Future<Database> database() async {
//  if (_database != null)
//    return _database;
//  _database = await initDB();
//  return _database;
//}
//
//initDB() async {
//  Directory documentsDirectory = await getApplicationDocumentsDirectory();
//  print(documentsDirectory.path);
//  String path =  join(documentsDirectory.path, "livebdb.db");
//  return await openDatabase(path, version: 1, onOpen: (db) {
//  }, onCreate: (Database db, int version) async {
//    await db.execute("CREATE TABLE positions ("
//        "id INTEGER PRIMARY KEY AUTOINCREMENT,"
//        "latitute TEXT,"
//        "longitude TEXT"
//        ")");
//  });
//}
//
//newPos(location) async {
//  print("inseriu!1 " + loca);
//  final db = await database();
//  var res = await db.rawInsert(
//      "INSERT Into positions (latitute, longitude)"
//          " VALUES ("+ location.latitude.toString() +", "+ location.longitude.toString() +")");
//  loca = location.latitude.toString() +", "+ location.longitude.toString();
//  print("inseriu! " + loca);
//  return res;
//}
//
//class DBProvider {
//  DBProvider._();
//  static final DBProvider db = DBProvider._();
//}





//apiGateway
//request