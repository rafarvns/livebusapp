
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:livebus/app/core/domain/line/Line.dart';
import 'package:livebus/app/core/domain/line/database/LineDatabaseBean.dart';
import '../User.dart';
part 'UserDatabaseBean.jorm.dart';

@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter) : super(adapter);
  @override
  String get tableName => 'USER';
}