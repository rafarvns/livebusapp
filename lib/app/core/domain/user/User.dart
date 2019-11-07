import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:livebus/app/core/domain/line/Line.dart';
import 'package:livebus/app/core/domain/line/database/LineDatabaseBean.dart';

class User {

  @PrimaryKey()
  int id;

  double latitude;
  double longitude;

  User();

  User.make(this.id, this.latitude, this.longitude);

  factory User.fromJson(Map<String, dynamic> json) {
    User user = new User.make(
      json['id'],
      json['latitude'],
      json['longitude']
    );
    return user;
  }

  factory User.dtoId(Map<String, dynamic> json, double latitude, double longitude) {
    User user = new User.make(
      json['data'],
      latitude,
      longitude
    );
    return user;
  }

  String toString() =>
    'Post({id: $id, latitude: $latitude, longitude: $longitude}';

}

