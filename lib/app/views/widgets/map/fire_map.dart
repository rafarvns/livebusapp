import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/shared/ApiConnector.dart';
import 'package:livebus/app/core/values/colors.dart';
import 'package:livebus/app/views/widgets/home/search_dialog.dart';
import 'package:location/location.dart';

class FireMap extends StatefulWidget {
  @override
  _FireMapState createState() => _FireMapState();
}

class _FireMapState extends State<FireMap> {
  GoogleMapController mapController;
  LocationData location;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  Set<Polyline> lstPolylines;

  @override
  build(context) {
    return Stack(children: [
      GoogleMap(
        initialCameraPosition:
            CameraPosition(target: LatLng(-10.16745, -48.3276596), zoom: 16.0),
        onMapCreated: _onMapCreated,
        myLocationEnabled: true,
        indoorViewEnabled: true,
        polylines: lstPolylines,
        markers: Set<Marker>.of(markers.values),
      ),
      Positioned(
        right: 12,
        bottom: 16,
        child: FloatingActionButton(
          onPressed: openSearchDialog(context),
          backgroundColor: primaryColor,
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            color: secondaryColor,
          ),
          elevation: 4.0,
        ),
      )
    ]); // widgets go here
  }

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
      _animateToUser();
      _add();
      _addPolylines();
    });
  }

  Future<LocationData> _getLiveLocation() async {
    Location location = new Location();
    return await location.getLocation();
  }

  void _animateToUser() async {
    var pos = await _getLiveLocation();
    print(pos.latitude.toString() + " | " + pos.longitude.toString());
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(pos.latitude, pos.longitude),
      zoom: 16.0,
    )));
  }

  void _addPolylines() {
    List<LatLng> lstLatLng = List<LatLng>();

    lstLatLng.add(LatLng(-10.1802, -48.334));

    Polyline polyline = Polyline(
      polylineId: PolylineId("1"),
      visible: true,
      points: lstLatLng,
      color: Colors.blue,
      width: 4,
    );
    this.lstPolylines = Set();
    this.lstPolylines.add(polyline);
  }

  void _add() async {
    BitmapDescriptor stopIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), "assets/busstop.png");
    var marker1 = Marker(
      position: LatLng(-10.180197, -48.334082),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("1"),
    );
    var marker2 = Marker(
      position: LatLng(-10.182910, -48.337223),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("2"),
    );
    var marker3 = Marker(
      position: LatLng(-10.184420, -48.339154),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("3"),
    );
    var marker4 = Marker(
      position: LatLng(-10.184317, -48.344455),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("4"),
    );
    var marker5 = Marker(
      position: LatLng(-10.184516, -48.348203),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("5"),
    );
    var marker6 = Marker(
      position: LatLng(-10.184136, -48.359346),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("6"),
    );
    var marker7 = Marker(
      position: LatLng(-10.184136, -48.359346),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("7"),
    );
    var marker8 = Marker(
      position: LatLng(-10.178185, -48.362423),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("8"),
    );
    var marker9 = Marker(
      position: LatLng(-10.176142, -48.361471),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("9"),
    );
    var marker10 = Marker(
      position: LatLng(-10.177388, -48.359797),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("10"),
    );
    var marker11 = Marker(
      position: LatLng(-10.179718, -48.359791),
      icon: stopIcon,
      infoWindow:
          InfoWindow(title: "Ponto de Ônibus", snippet: "Linhas:\n• 090"),
      markerId: MarkerId("11"),
    );

    setState(() {
      markers[MarkerId("1")] = marker1;
      markers[MarkerId("2")] = marker2;
      markers[MarkerId("3")] = marker3;
      markers[MarkerId("4")] = marker4;
      markers[MarkerId("5")] = marker5;
      markers[MarkerId("6")] = marker6;
      markers[MarkerId("7")] = marker7;
      markers[MarkerId("8")] = marker8;
      markers[MarkerId("9")] = marker9;
      markers[MarkerId("10")] = marker10;
      markers[MarkerId("11")] = marker11;
    });
  }
}
