import 'package:livebus/app/core/domain/line/Line.dart';
import 'package:livebus/app/core/domain/point/PointType.dart';

class Point {
  int _id;
  double _latitude;
  double _longitude;
  String _markerId;
  PointType _pointType;
  String _title;
  String _snippets;
  List<Line> _line;

  Point(this._id, this._latitude, this._longitude, this._markerId,
      this._pointType, this._title, this._snippets, this._line);

  factory Point.fromJson(Map<String, dynamic> json) {
    PointType pt;
    switch (json['pointType'].toString()) {
      case "STATION":
        pt = PointType.STATION;
        break;
      case "BASIC":
        pt = PointType.BASIC;
        break;
      case "MODERN":
        pt = PointType.MODERN;
        break;
      default:
        pt = PointType.BASIC;
        break;
    }
    List<Line> lstLine = (json['lines'] as List).map<Line>((line) => new Line.fromJson(line)).toList();
    Point point = new Point(json['id'], json['latitude'], json['longitude'],
        json['markerId'], pt, json['title'], json['snippets'], lstLine);
    return point;
  }

  List<Line> get line => _line;

  set line(List<Line> value) {
    _line = value;
  }

  String get snippets => _snippets;

  set snippets(String value) {
    _snippets = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  PointType get pointType => _pointType;

  set pointType(PointType value) {
    _pointType = value;
  }

  String get markerId => _markerId;

  set markerId(String value) {
    _markerId = value;
  }

  double get longitude => _longitude;

  set longitude(double value) {
    _longitude = value;
  }

  double get latitude => _latitude;

  set latitude(double value) {
    _latitude = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}
