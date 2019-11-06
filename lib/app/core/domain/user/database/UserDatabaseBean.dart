
import 'package:jaguar_orm/jaguar_orm.dart';
import 'package:livebus/app/core/domain/line/Line.dart';
import 'package:livebus/app/core/domain/line/database/LineDatabaseBean.dart';
import '../User.dart';
part 'UserDatabaseBean.jorm.dart';

@GenBean()
class UserBean extends Bean<User> with _UserBean {
  UserBean(Adapter adapter) : lineBean = LineBean(adapter), super(adapter);
  final LineBean lineBean;

  Future<int> updateReadField(int id, String markerId) async{
    Update st = updater.where(this.id.eq(id)).set(this.markerId, markerId);
    return adapter.update(st);
  }

  @override
  String get tableName => 'USER';
}