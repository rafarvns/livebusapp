import 'dart:convert';
import '../User.dart';
import 'package:livebus/app/core/shared/api/ApiService.dart';

import 'UserServiceAbstract.dart';

class UserService extends ApiConnector implements UserServiceAbstract {

  UserService():super("(User) >> ");

}