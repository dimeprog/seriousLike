import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../models/place.dart';

class MapScreen extends StatefulWidget {
  static const routeName = '/mapScreen';
  final PlaceLocation initialPosition;
  final bool isOnMapSelect;
  MapScreen(
      {this.initialPosition = const PlaceLocation(
        lat: 7.490462,
        long: 4.552127,
      ),
      this.isOnMapSelect = false});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  // static const _initialCameraPosition = CameraPosition(
  //   target: LatLng(37.444, -122.084),
  //   zoom: 11.6,
  // );
  LatLng? _pickLocation;

  void _setLocation(LatLng pos) {
    setState(() {
      _pickLocation = pos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your location'),
        actions: [
          if (widget.isOnMapSelect)
            IconButton(
              onPressed: _pickLocation == null
                  ? null
                  : () {
                      Navigator.of(context).pop(_pickLocation);
                    },
              icon: const Icon(
                Icons.check,
              ),
            ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        // zoomControlsEnabled: false,
        mapType: MapType.hybrid,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        initialCameraPosition: CameraPosition(
          target: LatLng(
            widget.initialPosition.lat,
            widget.initialPosition.long,
          ),
          zoom: 16,
        ),
        onTap: widget.isOnMapSelect ? _setLocation : null,
        markers: _pickLocation == null
            ? {}
            : {
                Marker(
                  markerId: MarkerId('m1'),
                  position: _pickLocation!,
                ),
              },
      ),
    );
  }
}
