import 'dart:io';

import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:livebus/app/core/domain/user/database/UserDatabase.dart';
import 'package:path/path.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:livebus/app/core/domain/live/LiveService.dart';
import 'package:livebus/app/core/domain/point/PointService.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDrawService.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class Repository{

  kiwi.Container _repository;

  Repository(){
    if(this._repository == null) this._repository = kiwi.Container();
  }

  initRepository(){
    _initDomainServices();
    _initDatabase();
  }

  dynamic getInstance(Type type){
    dynamic instance;
    switch(type.toString()){
      case "RouteDrawService":
        instance = _repository.resolve<RouteDrawService>();
        break;
      case "PointService":
        instance = _repository.resolve<PointService>();
        break;
      case "LiveService":
        instance = _repository.resolve<PointService>();
        break;

      case "UserDatabase":
        instance = _repository.resolve<UserDatabase>();
        break;
    }
    return instance;
  }

  void _initDomainServices() {
    _repository.registerInstance(RouteDrawService());
    _repository.registerInstance(PointService());
    _repository.registerInstance(LiveService());
  }

  Future _initDatabase() async {
    var dbPath = await getDatabasesPath();
    var adapter = SqfliteAdapter(path.join(dbPath, "livebusDB.db"));
    _repository.registerInstance(UserDatabase(adapter));
  }

}