
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';

abstract class RouteDrawServiceAbstract {

  Future<List<RouteDraw>> getAllRouteDrawByLine(int numberLine);

}