import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../constants/constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final LatLng _initialcameraposition = const LatLng(37.422099, -122.084047);

  final Completer<GoogleMapController> _controller = Completer();
  Constants getdata = Constants();

  final List<Marker> _marker = [];

  final List<Marker> _list = [];
  final Location _location = Location();

  @override
  initState() {
    super.initState();

    _list.add(Marker(
      markerId: const MarkerId('Id-1'),
      position: _initialcameraposition,
      infoWindow: InfoWindow(title: 'Eshan', snippet: '${getdata.pass(1)} km'),
    ));
    _list.add(Marker(
      markerId: const MarkerId('Id-2'),
      position: LatLng(getdata.data[1]["lat"], getdata.data[1]["lng"]),
      infoWindow: InfoWindow(
          title: 'Saqlain postion', snippet: '${getdata.pass(1)} km'),
    ));
    _list.add(Marker(
      markerId: const MarkerId('Id-3'),
      position: LatLng(getdata.data[2]["lat"], getdata.data[2]["lng"]),
      infoWindow: InfoWindow(
          title: 'Vikrant postion', snippet: '${getdata.pass(2)} km'),
    ));
    _list.add(Marker(
      markerId: const MarkerId('Id-4'),
      position: LatLng(getdata.data[3]["lat"], getdata.data[3]["lng"]),
      infoWindow:
          InfoWindow(title: 'Hardik postion', snippet: '${getdata.pass(3)} km'),
    ));
    _marker.addAll(_list);
  }

  static const CameraPosition _getcurrent = CameraPosition(
    target: LatLng(20.5937, 78.9629),
    zoom: 14,
  );

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller.complete(_cntlr);
    _location.onLocationChanged.listen((l) {
      _cntlr.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            GoogleMap(
              initialCameraPosition: _getcurrent,
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
              markers: Set.of(_marker),
            ),
          ],
        ),
      ),
    );
  }
}
