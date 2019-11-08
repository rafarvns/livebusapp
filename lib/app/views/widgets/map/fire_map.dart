import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_background_location/flutter_background_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:livebus/app/core/domain/live/LiveRequest.dart';
import 'package:livebus/app/core/domain/point/PointRequest.dart';
import 'package:livebus/app/core/domain/route_draw/RouteDrawRequest.dart';
import 'package:livebus/app/core/domain/user/User.dart';
import 'package:livebus/app/core/domain/user/UserRequest.dart';
import 'package:livebus/app/core/shared/container/Repository.dart';
import 'package:livebus/app/core/values/colors.dart';
import 'package:livebus/app/views/widgets/home/search_dialog.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool lock = true;

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
        right: 16,
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
      _addPoints();
      _addPolylines();
    });
    FlutterBackgroundLocation.startLocationService();
    FlutterBackgroundLocation.getLocationUpdates((location) {
      if(lock) {
        lock = false;
        updatePos(location);
        markers.clear();
      }
    });
  }

  Future updatePos(location) async {
    User user = await Repository().getInstance(User);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    user.id = prefs.getInt('userId');
    user.latitude = location.latitude;
    user.longitude = location.longitude;
    lock = await UserRequest().updateUserPosition(user);
    setState(() {
      _drawLiveBuses();
    });
  }

  void _drawLiveBuses() async {
    BitmapDescriptor liveBusIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(54, 54)), "assets/bus_yellow.png");
    await LiveRequest().getAllLiveBusesByLine(90).then((buses) {
      if(buses!=null){
        int mId = 0;
        buses.forEach((bus) {
          mId++;
          setState(() {
            markers[MarkerId("$mId")] = Marker(
              position: LatLng(bus.latitude, bus.longitude),
              icon: liveBusIcon,
              infoWindow:
              InfoWindow(title: "Ônibus", snippet: "Linha 090"),
              markerId: MarkerId("$mId"),
            );
          });
        });
      }
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
    rt.getAllRouteDrawByLine(90).then((routesDraw) {
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

  void _addPoints() async {
    BitmapDescriptor stopIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(48, 48)), "assets/busstop.png");
    PointRequest pr = new PointRequest();
    pr.getAllByNumber(90).then((points) {
      if (points != null) {
        int mId = 0;
        points.forEach((point) {
          mId++;
          setState(() {
            markers[MarkerId("$mId")] = Marker(
              position: LatLng(point.latitude, point.longitude),
              icon: stopIcon,
              infoWindow:
                  InfoWindow(title: point.title, snippet: point.snippets),
              markerId: MarkerId("$mId"),
            );
          });
        });
      }
    });
  }



}
