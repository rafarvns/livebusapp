
import 'package:jaguar_query_sqflite/src/adapter.dart';
import 'package:livebus/app/core/domain/user/User.dart';
import 'package:livebus/app/core/shared/database/SQLiteDatabase.dart';
import '../UserDatabaseAbstract.dart';
import 'UserDatabaseBean.dart';

class UserDatabase extends SQLiteDatabase implements UserDatabaseAbstract {

  UserBean _bean;

  UserDatabase(SqfliteAdapter adapter) : super(adapter){
    _bean = UserBean(adapter);
    _initBean();
  }

  Future _initBean() async {
    await _bean.drop();
  }





}