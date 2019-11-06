import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:livebus/app/core/domain/line/Line.dart';
import 'package:livebus/app/core/domain/line/database/LineDatabaseBean.dart';

class User {

  @PrimaryKey()
  int id;

  double latitude;
  double longitude;
  String markerId;
  String title;
  String snippets;

  @HasMany(LineBean)
  List<Line> lines;

  User();
  User.make(this.id, this.latitude, this.longitude, this.markerId, this.title,
    this.snippets, this.lines);

  factory User.fromJson(Map<String, dynamic> json) {
    List<Line> lstLine = (json['lines'] as List).map<Line>((line) => new Line.fromJson(line)).toList();
    User user = new User.make(
      json['id'],
      json['latitude'],
      json['longitude'],
      json['markerId'],
      json['title'],
      json['snippets'],
      lstLine);
    return user;
  }

  String toString() =>
    'Post({id: $id, latitude: $latitude, longitude: $longitude, markerId: $markerId, title: $title, snippets: $snippets, lstLine: {$lines.toString()}}';

}

