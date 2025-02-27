
import 'package:livebus/app/core/domain/line/Line.dart';

class RouteDraw {
  int _id;
  double _latitude;
  double _longitude;
  int _indexPos;
  Line _line;

  RouteDraw(this._id, this._latitude, this._longitude, this._indexPos,
    this._line);

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

  Line get line => _line;

  set line(Line value) {
    _line = value;
  }

  int get indexPos => _indexPos;

  set indexPos(int value) {
    _indexPos = value;
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