import 'dart:convert';
import 'package:livebus/app/core/shared/container/Repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../User.dart';
import 'package:livebus/app/core/shared/api/ApiService.dart';

import 'UserServiceAbstract.dart';

class UserService extends ApiConnector implements UserServiceAbstract {

  UserService();

  @override
  Future<User> updateUserPosition(User userInstance) async {
    var id = userInstance.id;
    var latitude = userInstance.latitude;
    var longitude = userInstance.longitude;
    var parsed = await post("user/updateUserPosition/$id/$latitude/$longitude");
    User user = User.dtoId(parsed, latitude, longitude);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', user.id);
    return user;
  }

}