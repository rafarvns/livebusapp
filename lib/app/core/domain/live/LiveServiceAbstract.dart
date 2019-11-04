
import 'package:livebus/app/core/domain/live/Live.dart';

abstract class LiveServiceAbstract {

  Future<List<Live>> getAllLiveBusesByLine(int numberLine);

}