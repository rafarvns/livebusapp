
import 'Point.dart';


abstract class PointServiceAbstract {

  Future<List<Point>> getAllByNumber(int numberLine);

}