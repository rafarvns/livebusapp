

import 'Point.dart';
import 'PointService.dart';
import 'PointServiceAbstract.dart';

class PointRequest {

    PointServiceAbstract _service;

    PointRequest() {
      _service = new PointService();
    }

    Future<List<Point>> getAllByNumber(int number){
      return _service.getAllByNumber(number);
    }

}