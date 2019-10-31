import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDraw.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDrawRequest.dart';
import 'package:livebus/app/core/shared/ApiService.dart';
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

    RouteDrawRequest rt = new RouteDrawRequest();
    rt.getAllRouteDrawByLine(90).then((routesDraw){
      if (routesDraw != null) {
        List<LatLng> lstLatLng = List<LatLng>();
        routesDraw.forEach(
            (route) => lstLatLng.add(LatLng(route.latitude, route.longitude)));
        Polyline polyline = Polyline(
          polylineId: PolylineId("1"),
          visible: true,
          points: lstLatLng,
          color: Colors.blue,
          width: 6,
        );
        this.lstPolylines = Set();
        this.lstPolylines.add(polyline);
      }
    });

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

    setState(() {
      markers[MarkerId("1")] = marker1;

    });
  }
}
