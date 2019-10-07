
import 'package:flutter/material.dart';
import 'package:livebus/app/core/values/colors.dart';
import 'package:livebus/app/views/widgets/home/app_bar.dart';
import 'package:livebus/app/views/widgets/map/fire_map.dart';
import 'package:livebus/app/views/widgets/menu_drawer.dart';


Scaffold homePage() {
  return Scaffold(
    backgroundColor: lightColor,
    appBar: appBar(),
    drawer: navigationDrawer(),
    body: FireMap(),
  );
}
