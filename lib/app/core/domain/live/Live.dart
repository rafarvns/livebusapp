
import 'package:livebus/app/core/domain/line/Line.dart';

class Live {
  int _id;
  double _latitude;
  double _longitude;
  int _trustLevel;
  Line _line;

  Live(this._id, this._latitude, this._longitude, this._trustLevel,
    this._line);

  factory Live.fromJson(Map<String, dynamic> json) {
    Live live = new Live(
      json['id'],
      json['latitude'],
      json['longitude'],
      json['trustLevel'],
      Line.fromJson(json['line'])
    );
    return live;
  }

  factory Live.summaryDTO(Map<String, dynamic> json) {
    Live live = new Live(
      null,
      json['latitude'],
      json['longitude'],
      json['trustLevel'],
      null,
    );
    return live;
  }

  Line get line => _line;

  set line(Line value) {
    _line = value;
  }

  int get trustLevel => _trustLevel;

  set trustLevel(int value) {
    _trustLevel = value;
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