
import 'dart:convert';

import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDrawServiceAbstract.dart';
import 'package:livebus/app/core/shared/ApiService.dart';

class RouteDrawService extends ApiConnector implements RouteDrawServiceAbstract {

  RouteDrawService():super("(RouteDraw) >> ");

  @override
  Future<List<RouteDraw>> getAllRouteDrawByLine(int numberLine) async {
    var parsed = await get("routedraw/byLine/$numberLine");
    return (parsed["data"] as List).map<RouteDraw>((json) => new RouteDraw.fromJson(json)).toList();
  }

}