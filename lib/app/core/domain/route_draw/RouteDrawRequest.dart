
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDrawService.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDrawServiceAbstract.dart';

class RouteDrawRequest {

    RouteDrawServiceAbstract _service;

    RouteDrawRequest() { _service = new RouteDrawService(); }

    Future<List<RouteDraw>> getAllRouteDrawByLine(int number){
      return _service.getAllRouteDrawByLine(number);
    }

}