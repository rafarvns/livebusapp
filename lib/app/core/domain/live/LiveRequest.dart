
import 'package:livebus/app/core/domain/live/Live.dart';
import 'package:livebus/app/core/domain/live/LiveService.dart';
import 'package:livebus/app/core/domain/live/LiveServiceAbstract.dart';

class LiveRequest {

    LiveServiceAbstract _service;

    LiveRequest() { _service = new LiveService(); }

    Future<List<Live>> getAllLiveBusesByLine(int number){
      return _service.getAllLiveBusesByLine(number);
    }

}