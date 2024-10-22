

import 'package:livebus/app/core/domain/user/api/UserServiceAbstract.dart';
import 'package:livebus/app/core/domain/user/database/UserDatabase.dart';
import 'package:livebus/app/core/domain/user/database/UserDatabaseAbstract.dart';
import 'package:livebus/app/core/shared/container/Repository.dart';

import 'User.dart';
import 'api/UserService.dart';

class UserRequest {

    UserServiceAbstract _service;
    UserDatabaseAbstract _database;

    UserRequest() {
      _service = Repository().getInstance(UserService);
      _database = Repository().getInstance(UserDatabase);
    }

    Future<bool> updateUserPosition(User userInstance) async {
      User user = await _service.updateUserPosition(userInstance);
      await Repository().updateRepositoryAppUser(user);
//      await _database.updateUser(user);
      return true;
    }

}