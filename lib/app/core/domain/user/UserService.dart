
import 'dart:convert';

import 'User.dart';
import 'UserServiceAbstract.dart';
import 'package:livebus/app/core/shared/api/ApiService.dart';

class UserService extends ApiConnector implements UserServiceAbstract {

  UserService():super("(User) >> ");

}