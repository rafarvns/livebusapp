
import 'dart:convert';

import 'package:livebus/app/core/domain/live/Live.dart';
import 'package:livebus/app/core/domain/live/LiveServiceAbstract.dart';
import 'package:livebus/app/core/shared/ApiService.dart';

class LiveService extends ApiConnector implements LiveServiceAbstract {

  LiveService():super("(Live) >> ");

  @override
  Future<List<Live>> getAllLiveBusesByLine(int numberLine) async {
    var parsed = await get("live/getLiveBusByLine/$numberLine");
    return (parsed["data"] as List).map<Live>((json) => new Live.summaryDTO(json)).toList();
  }

}