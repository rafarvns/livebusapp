
import 'User.dart';


abstract class UserServiceAbstract {

  Future<List<User>> getAllByNumber(int numberLine);

}