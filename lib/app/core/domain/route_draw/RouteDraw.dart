
import 'package:livebus/app/core/domain/line/Line.dart';

class RouteDraw {
  int id;
  double latitude;
  double longitude;
  int indexPos;
  Line line;
  
  RouteDraw(this.id, this.latitude, this.longitude, this.indexPos, this.line);

  factory RouteDraw.fromJson(Map<String, dynamic> json) {
    RouteDraw route = new RouteDraw(
      json['id'],
      json['latitude'],
      json['longitude'],
      json['indexPos'],
      Line.fromJson(json['line'])
    );
    return route;
  }

}