
import 'package:livebus/app/core/domain/line/Line.dart';

class Point {
  int id;
  double latitude;
  double longitude;
  String markerId;
  String pointType;
  String title;
  String snippets;
  Line line;

  Point(this.id, this.latitude, this.longitude, this.markerId, this.pointType,
    this.title, this.snippets, this.line);

  factory Point.fromJson(Map<String, dynamic> json) {
    Point point = new Point(
      json['id'],
      json['latitude'],
      json['longitude'],
      null,
      json['pointType'],
      json['title'],
      json['snippets'],
      null
    );
    return point;
  }

}