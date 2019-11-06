
import 'package:livebus/app/core/domain/live/Live.dart';
import 'package:livebus/app/core/domain/live/LiveService.dart';
import 'package:livebus/app/core/domain/live/LiveServiceAbstract.dart';
import 'package:livebus/app/core/domain/user/UserService.dart';
import 'package:livebus/app/core/shared/container/Repository.dart';

class LiveRequest {

    LiveServiceAbstract _service;

    LiveRequest() { new Repository().getInstance(LiveService); }

    Future<List<Live>> getAllLiveBusesByLine(int number){
      return _service.getAllLiveBusesByLine(number);
    }

}