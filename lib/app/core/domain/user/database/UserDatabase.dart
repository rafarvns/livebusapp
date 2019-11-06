
import 'package:jaguar_query_sqflite/src/adapter.dart';
import 'UserDatabaseAbstract.dart';
import 'UserDatabaseBean.dart';

class UserDatabase implements UserDatabaseAbstract {

  UserBean _bean;
  SqfliteAdapter _adapter;

  UserDatabase(SqfliteAdapter adapter){
    _adapter = adapter;
    _initBean();
  }


  Future _initBean() async {
    await _adapter.connect();
    _bean = UserBean(_adapter);
    await _bean.createTable(ifNotExists: true);
  }

}