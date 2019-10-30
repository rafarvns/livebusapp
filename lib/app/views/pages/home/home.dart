import 'package:flutter/material.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/shared/ApiConnector.dart';
import 'package:livebus/app/views/widgets/home/home_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return homePage();
  }

  @override
  void initState() {
    super.initState();
    getApi();
  }

  Future getApi() async {
    ApiConnector api = new ApiConnector();
    List<RouteDraw> routeDraw;
    routeDraw = await api.get("routedraw");
    print('a');
  }
}
