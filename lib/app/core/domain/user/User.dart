import 'package:livebus/app/core/domain/line/Line.dart';

class User {
  int _id;
  double _latitude;
  double _longitude;
  String _markerId;
  String _title;
  String _snippets;
  List<Line> _line;

  User(this._id, this._latitude, this._longitude, this._markerId, this._title,
    this._snippets, this._line);

  factory User.fromJson(Map<String, dynamic> json) {
    List<Line> lstLine = (json['lines'] as List).map<Line>((line) => new Line.fromJson(line)).toList();
    User user = new User(
      json['id'],
      json['latitude'],
      json['longitude'],
      json['markerId'],
      json['title'],
      json['snippets'],
      lstLine);
    return user;
  }

}
