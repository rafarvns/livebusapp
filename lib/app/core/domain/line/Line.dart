
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:livebus/app/core/domain/user/database/UserDatabaseBean.dart';

class Line {
  @PrimaryKey()
  int id;

  int number;
  String name;

  @BelongsTo(UserBean)
  int userId;

  Line.make(this.id, this.number, this.name);

  Line();

  factory Line.fromJson(Map<String, dynamic> json) {
    Line line = new Line.make(
      json['id'],
      json['number'],
      json['name'],
    );
    return line;
  }

  String toString() =>
    'Post({id: $id, number: $number, name: $name}';

}






