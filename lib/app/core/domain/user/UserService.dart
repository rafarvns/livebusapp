
import 'dart:convert';

import 'User.dart';
import 'UserServiceAbstract.dart';
import 'package:livebus/app/core/shared/api/ApiService.dart';

class UserService extends ApiConnector implements UserServiceAbstract {

  UserService():super("(User) >> ");

  @override
  Future<List<User>> getAllByNumber(int numberLine) async {
    var parsed = await get("user/byLine/$numberLine");
    return (parsed["data"] as List).map<User>((json)=> new User.fromJson(json)).toList();
  }

//  @override
//  Future<List<RouteDraw>> getAllRouteDrawByLine() async {
//    var parsed = await get("user");
//    return (parsed["data"] as List).map<RouteDraw>((json)=> new RouteDraw.fromJson(json)).toList();
//  }

}