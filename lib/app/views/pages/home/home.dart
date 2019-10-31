import 'package:flutter/material.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/shared/ApiService.dart';
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
  }

}
