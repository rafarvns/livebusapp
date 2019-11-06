
import 'package:jaguar_query_sqflite/jaguar_query_sqflite.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDatabase {

  SqfliteAdapter _adapter;

  SQLiteDatabase(this._adapter){
      _connectDatabase();
  }

  SqfliteAdapter get adapter => _adapter;

  set adapter(SqfliteAdapter value) {
    _adapter = value;
  }

  Future _connectDatabase() async {
    await _adapter.connect();
  }

}