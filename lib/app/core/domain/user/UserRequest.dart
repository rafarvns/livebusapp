

import 'package:livebus/app/core/shared/container/Repository.dart';

import 'User.dart';
import 'UserService.dart';
import 'UserServiceAbstract.dart';

class UserRequest {

    UserServiceAbstract _service;

    UserRequest() {
      _service = new Repository().getInstance(UserService);
    }

    Future<List<User>> getAllByNumber(int number){
      return _service.getAllByNumber(number);
    }

}