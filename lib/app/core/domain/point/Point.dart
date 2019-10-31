
import 'package:livebus/app/core/domain/line/Line.dart';
import 'package:livebus/app/core/enums/EPointType.dart';

class Point {
  int id;
  double latitude;
  double longitude;
  String markerId;
  EPointType pointType;
  String title;
  String snippets;

  Point(this.id, this.latitude, this.longitude, this.markerId, this.pointType,
    this.title, this.snippets);

  factory Point.fromJson(Map<String, dynamic> json) {
    Point point = new Point(
      json['id'],
      json['latitude'],
      json['longitude'],
      json['markerId'],
      json['pointType'],
      json['title'],
      json['snippets'],
    );
    return point;
  }

}