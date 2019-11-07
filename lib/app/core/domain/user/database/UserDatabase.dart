
import 'dart:developer';

import 'package:jaguar_query_sqflite/src/adapter.dart';
import 'package:livebus/app/core/shared/container/Repository.dart';
import '../User.dart';
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
    List<User> user = await _bean.getAll();
    //verifica se já foi criado um usuário, se sim, atualiza o singleton, se não, grava no banco passando o singleton gerado automaticamente na inicialização do container
    if(user.length > 0){
      Repository repository = Repository();
      repository.updateUserSingleton(user.elementAt(0));
    } else {
      await _bean.insert(Repository().getInstance(User));
    }
  }

  @override
  Future updateUser(User user) async {
    _bean = UserBean(_adapter);
    await _bean.update(user);
  }

}