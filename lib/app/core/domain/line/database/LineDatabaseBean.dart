
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:livebus/app/core/domain/user/User.dart';
import 'package:livebus/app/core/domain/user/database/UserDatabaseBean.dart';
import '../Line.dart';
part 'LineDatabaseBean.jorm.dart';

@GenBean()
class LineBean extends Bean<Line> with _LineBean {
  UserBean _userBean;
  UserBean get userBean => _userBean ??= UserBean(adapter);

  LineBean(Adapter adapter) : super(adapter);

  @override
  String get tableName => 'LINE';
}