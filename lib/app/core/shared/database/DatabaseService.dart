
import 'package:livebus/app/core/shared/container/Repository.dart';
import 'package:livebus/app/core/shared/database/SQLiteConnector.dart';

class DatabaseService{

  SQLiteDatabase _database;

  DatabaseService(){
    _database = new Repository().getInstance(SQLiteDatabase);
  }



}