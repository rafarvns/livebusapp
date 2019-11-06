import 'dart:io';

import 'package:livebus/app/core/shared/database/Migration.dart';
import 'package:path/path.dart';
import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:livebus/app/core/domain/live/LiveService.dart';
import 'package:livebus/app/core/domain/point/PointService.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDrawService.dart';
import 'package:livebus/app/core/shared/database/SQLiteConnector.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

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

      case "SQLiteDatabase":
        instance = _repository.resolve<SQLiteDatabase>();
        break;
    }
    return instance;
  }

  void _initDomainServices() {
    _repository.registerInstance(RouteDrawService());
    _repository.registerInstance(PointService());
    _repository.registerInstance(LiveService());
  }

  void _initDatabase() {
    _repository.registerSingleton((c) async => SQLiteDatabase(await _initDataBase()));
  }

  Future<Database> _initDataBase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    print(documentsDirectory.path);
    String path =  join(documentsDirectory.path, "livebusdb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute(Migration().get());
    });
}

}