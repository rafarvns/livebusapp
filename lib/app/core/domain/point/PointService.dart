
import 'dart:convert';

import 'Point.dart';
import 'PointServiceAbstract.dart';
import 'package:livebus/app/core/shared/api/ApiService.dart';

class PointService extends ApiConnector implements PointServiceAbstract {

  PointService();

  @override
  Future<List<Point>> getAllByNumber(int numberLine) async {
    var parsed = await get("point/byLine/$numberLine");
    return (parsed["data"] as List).map<Point>((json)=> new Point.fromJson(json)).toList();
  }

//  @override
//  Future<List<RouteDraw>> getAllRouteDrawByLine() async {
//    var parsed = await get("user");
//    return (parsed["data"] as List).map<RouteDraw>((json)=> new RouteDraw.fromJson(json)).toList();
//  }

}