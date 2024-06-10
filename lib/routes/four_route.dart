import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:flutter/widgets.dart';

class Four extends StatefulWidget {
  const Four({super.key});

  @override
  State<Four> createState() => _FourState();
}

class _FourState extends State<Four> {
  //step 1 setup control
  late GoogleMapController mapController;
  //step 2 setup the center of the map
  final LatLng _center = const LatLng(46.090946, -64.774567);
  //step 3 setup default mapType
  MapType _currentMapType = MapType.normal;
  //step  4  create the method to set the onMapCreate property
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  //step 5 create a method to toggle the map
  void _mapTypeStyle() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  // step to create and add markers
  //step 1
  final Set<Marker> _markers = {};
  //step 3
  late LatLng _lastMapPosition = _center;
  //step 4
  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
    debugPrint(_lastMapPosition.toString());
  }

  //step 6
  void _addMarker() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          infoWindow: const InfoWindow(
              title: 'this is a good spot ', snippet: 'this has a 5 star'),
          icon: BitmapDescriptor.defaultMarker,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('google map')),
      body: Stack(children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 9.0,
          ),
          mapType: _currentMapType,
          zoomControlsEnabled: false,
          //step 2
          markers: _markers,
          //step 5
          onCameraMove: _onCameraMove,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () => _mapTypeStyle(),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.green,
                child: const Icon(
                  Icons.school_sharp,
                  size: 36,
                ),
              ),
              FloatingActionButton(
                onPressed: () => _addMarker(),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.map,
                  size: 36,
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
