import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
    lstLatLng.add(LatLng(-10.1803, -48.334));
    lstLatLng.add(LatLng(-10.1806, -48.3343));
    lstLatLng.add(LatLng(-10.1806, -48.3353));
    lstLatLng.add(LatLng(-10.1806, -48.3359));
    lstLatLng.add(LatLng(-10.1807, -48.3365));
    lstLatLng.add(LatLng(-10.1807, -48.3364));
    lstLatLng.add(LatLng(-10.1807, -48.3366));
    lstLatLng.add(LatLng(-10.1805, -48.3368));
    lstLatLng.add(LatLng(-10.1804, -48.3372));
    lstLatLng.add(LatLng(-10.1811, -48.3375));
    lstLatLng.add(LatLng(-10.1818, -48.3373));
    lstLatLng.add(LatLng(-10.1828, -48.3372));
    lstLatLng.add(LatLng(-10.1831, -48.3372));
    lstLatLng.add(LatLng(-10.1836, -48.3371));
    lstLatLng.add(LatLng(-10.184, -48.3371));
    lstLatLng.add(LatLng(-10.184, -48.3372));
    lstLatLng.add(LatLng(-10.1842, -48.3373));
    lstLatLng.add(LatLng(-10.1846, -48.3378));
    lstLatLng.add(LatLng(-10.1846, -48.3383));
    lstLatLng.add(LatLng(-10.1844, -48.3388));
    lstLatLng.add(LatLng(-10.1845, -48.3391));
    lstLatLng.add(LatLng(-10.1845, -48.339));
    lstLatLng.add(LatLng(-10.1846, -48.3398));
    lstLatLng.add(LatLng(-10.1846, -48.3407));
    lstLatLng.add(LatLng(-10.1845, -48.3419));
    lstLatLng.add(LatLng(-10.1845, -48.3421));
    lstLatLng.add(LatLng(-10.1845, -48.3422));
    lstLatLng.add(LatLng(-10.1847, -48.3423));
    lstLatLng.add(LatLng(-10.1845, -48.3424));
    lstLatLng.add(LatLng(-10.1847, -48.3431));
    lstLatLng.add(LatLng(-10.1847, -48.3442));
    lstLatLng.add(LatLng(-10.1845, -48.3449));
    lstLatLng.add(LatLng(-10.1845, -48.3457));
    lstLatLng.add(LatLng(-10.1845, -48.347));
    lstLatLng.add(LatLng(-10.1845, -48.3473));
    lstLatLng.add(LatLng(-10.1844, -48.3476));
    lstLatLng.add(LatLng(-10.1845, -48.3483));
    lstLatLng.add(LatLng(-10.1846, -48.3484));
    lstLatLng.add(LatLng(-10.1845, -48.3482));
    lstLatLng.add(LatLng(-10.1846, -48.3483));
    lstLatLng.add(LatLng(-10.1846, -48.3489));
    lstLatLng.add(LatLng(-10.1847, -48.3494));
    lstLatLng.add(LatLng(-10.1848, -48.3504));
    lstLatLng.add(LatLng(-10.1848, -48.3512));
    lstLatLng.add(LatLng(-10.1848, -48.3518));
    lstLatLng.add(LatLng(-10.1848, -48.3523));
    lstLatLng.add(LatLng(-10.1848, -48.3527));
    lstLatLng.add(LatLng(-10.1849, -48.3534));
    lstLatLng.add(LatLng(-10.1847, -48.3546));
    lstLatLng.add(LatLng(-10.1847, -48.3556));
    lstLatLng.add(LatLng(-10.1845, -48.3563));
    lstLatLng.add(LatLng(-10.1847, -48.3573));
    lstLatLng.add(LatLng(-10.1848, -48.3586));
    lstLatLng.add(LatLng(-10.1845, -48.3595));
    lstLatLng.add(LatLng(-10.1842, -48.3596));
    lstLatLng.add(LatLng(-10.1839, -48.3595));
    lstLatLng.add(LatLng(-10.1836, -48.3594));
    lstLatLng.add(LatLng(-10.1832, -48.3594));
    lstLatLng.add(LatLng(-10.1828, -48.3593));
    lstLatLng.add(LatLng(-10.1822, -48.3584));
    lstLatLng.add(LatLng(-10.1819, -48.3578));
    lstLatLng.add(LatLng(-10.1814, -48.3564));
    lstLatLng.add(LatLng(-10.181, -48.3556));
    lstLatLng.add(LatLng(-10.1802, -48.3546));
    lstLatLng.add(LatLng(-10.1795, -48.3537));
    lstLatLng.add(LatLng(-10.179, -48.3532));
    lstLatLng.add(LatLng(-10.1788, -48.3528));
    lstLatLng.add(LatLng(-10.1786, -48.3525));
    lstLatLng.add(LatLng(-10.1783, -48.3532));
    lstLatLng.add(LatLng(-10.1788, -48.3535));
    lstLatLng.add(LatLng(-10.1793, -48.3539));
    lstLatLng.add(LatLng(-10.1797, -48.3544));
    lstLatLng.add(LatLng(-10.1801, -48.3549));
    lstLatLng.add(LatLng(-10.181, -48.3563));
    lstLatLng.add(LatLng(-10.1814, -48.3571));
    lstLatLng.add(LatLng(-10.182, -48.3584));
    lstLatLng.add(LatLng(-10.1823, -48.359));
    lstLatLng.add(LatLng(-10.1821, -48.3592));
    lstLatLng.add(LatLng(-10.1816, -48.3594));
    lstLatLng.add(LatLng(-10.1812, -48.3595));
    lstLatLng.add(LatLng(-10.181, -48.36));
    lstLatLng.add(LatLng(-10.1818, -48.36));
    lstLatLng.add(LatLng(-10.1821, -48.36));
    lstLatLng.add(LatLng(-10.1821, -48.3602));
    lstLatLng.add(LatLng(-10.182, -48.3602));
    lstLatLng.add(LatLng(-10.1818, -48.3603));
    lstLatLng.add(LatLng(-10.1814, -48.3606));
    lstLatLng.add(LatLng(-10.1812, -48.3609));
    lstLatLng.add(LatLng(-10.1812, -48.3616));
    lstLatLng.add(LatLng(-10.181, -48.3625));
    lstLatLng.add(LatLng(-10.18, -48.3626));
    lstLatLng.add(LatLng(-10.1792, -48.3625));
    lstLatLng.add(LatLng(-10.1787, -48.3625));
    lstLatLng.add(LatLng(-10.1784, -48.3624));
    lstLatLng.add(LatLng(-10.1783, -48.3624));
    lstLatLng.add(LatLng(-10.178, -48.3625));
    lstLatLng.add(LatLng(-10.1777, -48.3625));
    lstLatLng.add(LatLng(-10.1771, -48.3625));
    lstLatLng.add(LatLng(-10.1767, -48.3625));
    lstLatLng.add(LatLng(-10.1761, -48.3625));
    lstLatLng.add(LatLng(-10.1759, -48.3622));
    lstLatLng.add(LatLng(-10.176, -48.3615));
    lstLatLng.add(LatLng(-10.1761, -48.3615));
    lstLatLng.add(LatLng(-10.1761, -48.3614));
    lstLatLng.add(LatLng(-10.176, -48.3612));
    lstLatLng.add(LatLng(-10.176, -48.3606));
    lstLatLng.add(LatLng(-10.176, -48.3602));
    lstLatLng.add(LatLng(-10.176, -48.3597));
    lstLatLng.add(LatLng(-10.1764, -48.3596));
    lstLatLng.add(LatLng(-10.1768, -48.3597));
    lstLatLng.add(LatLng(-10.177, -48.3597));
    lstLatLng.add(LatLng(-10.1773, -48.3597));
    lstLatLng.add(LatLng(-10.1774, -48.3598));
    lstLatLng.add(LatLng(-10.1773, -48.3598));
    lstLatLng.add(LatLng(-10.1776, -48.3597));
    lstLatLng.add(LatLng(-10.178, -48.3597));
    lstLatLng.add(LatLng(-10.1784, -48.3597));
    lstLatLng.add(LatLng(-10.1788, -48.3597));
    lstLatLng.add(LatLng(-10.1797, -48.3598));
    lstLatLng.add(LatLng(-10.1796, -48.3597));
    lstLatLng.add(LatLng(-10.1797, -48.3597));
    lstLatLng.add(LatLng(-10.1802, -48.3597));
    lstLatLng.add(LatLng(-10.1806, -48.3597));
    lstLatLng.add(LatLng(-10.1814, -48.3601));
    lstLatLng.add(LatLng(-10.1817, -48.3594));
    lstLatLng.add(LatLng(-10.182, -48.359));
    lstLatLng.add(LatLng(-10.1823, -48.3588));
    lstLatLng.add(LatLng(-10.1825, -48.359));
    lstLatLng.add(LatLng(-10.1832, -48.3595));
    lstLatLng.add(LatLng(-10.1844, -48.3598));
    lstLatLng.add(LatLng(-10.1847, -48.3598));
    lstLatLng.add(LatLng(-10.1848, -48.3599));
    lstLatLng.add(LatLng(-10.185, -48.36));
    lstLatLng.add(LatLng(-10.1852, -48.3598));
    lstLatLng.add(LatLng(-10.1848, -48.3588));
    lstLatLng.add(LatLng(-10.1848, -48.3574));
    lstLatLng.add(LatLng(-10.1848, -48.3566));
    lstLatLng.add(LatLng(-10.1849, -48.3558));
    lstLatLng.add(LatLng(-10.185, -48.3555));
    lstLatLng.add(LatLng(-10.1848, -48.3546));
    lstLatLng.add(LatLng(-10.1847, -48.3539));
    lstLatLng.add(LatLng(-10.1847, -48.3526));
    lstLatLng.add(LatLng(-10.1849, -48.3521));
    lstLatLng.add(LatLng(-10.1847, -48.3516));
    lstLatLng.add(LatLng(-10.1847, -48.3504));
    lstLatLng.add(LatLng(-10.1847, -48.3492));
    lstLatLng.add(LatLng(-10.1847, -48.3486));
    lstLatLng.add(LatLng(-10.1847, -48.3478));
    lstLatLng.add(LatLng(-10.1847, -48.348));
    lstLatLng.add(LatLng(-10.1848, -48.3479));
    lstLatLng.add(LatLng(-10.1847, -48.3476));
    lstLatLng.add(LatLng(-10.1849, -48.3471));
    lstLatLng.add(LatLng(-10.1849, -48.3467));
    lstLatLng.add(LatLng(-10.1847, -48.346));
    lstLatLng.add(LatLng(-10.1847, -48.3456));
    lstLatLng.add(LatLng(-10.1847, -48.3444));
    lstLatLng.add(LatLng(-10.1847, -48.3434));
    lstLatLng.add(LatLng(-10.1847, -48.3432));
    lstLatLng.add(LatLng(-10.1847, -48.3429));
    lstLatLng.add(LatLng(-10.1849, -48.3427));
    lstLatLng.add(LatLng(-10.1849, -48.3423));
    lstLatLng.add(LatLng(-10.1847, -48.3416));
    lstLatLng.add(LatLng(-10.1847, -48.3406));
    lstLatLng.add(LatLng(-10.1847, -48.3401));
    lstLatLng.add(LatLng(-10.1847, -48.3392));
    lstLatLng.add(LatLng(-10.1847, -48.3391));
    lstLatLng.add(LatLng(-10.1847, -48.3389));
    lstLatLng.add(LatLng(-10.1846, -48.3382));
    lstLatLng.add(LatLng(-10.1846, -48.3377));
    lstLatLng.add(LatLng(-10.1846, -48.3374));
    lstLatLng.add(LatLng(-10.1849, -48.3372));
    lstLatLng.add(LatLng(-10.1849, -48.3367));
    lstLatLng.add(LatLng(-10.1844, -48.3366));
    lstLatLng.add(LatLng(-10.184, -48.3369));
    lstLatLng.add(LatLng(-10.1831, -48.337));
    lstLatLng.add(LatLng(-10.1825, -48.3371));
    lstLatLng.add(LatLng(-10.1814, -48.3371));
    lstLatLng.add(LatLng(-10.1811, -48.3371));
    lstLatLng.add(LatLng(-10.181, -48.3369));
    lstLatLng.add(LatLng(-10.1804, -48.3368));
    lstLatLng.add(LatLng(-10.1795, -48.337));
    lstLatLng.add(LatLng(-10.1789, -48.337));
    lstLatLng.add(LatLng(-10.1787, -48.337));

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
