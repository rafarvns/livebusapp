

import 'package:flutter/material.dart';
import 'package:livebus/app/core/values/colors.dart';

AppBar appBar(){
  return AppBar(
    backgroundColor: primaryColor,
    title: Text("Live bus"),
    actions: <Widget>[
      IconButton(
        icon: Icon(
          Icons.star_border,
          color: iconsColor,
        ),
        onPressed: () {},
      ),
      IconButton(
        icon: Icon(
          Icons.directions_bus,
          color: iconsColor,
        ),
        onPressed: () {},
      ),
    ],
  );
}