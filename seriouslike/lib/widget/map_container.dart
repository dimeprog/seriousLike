import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seriouslike/screens/map_screen.dart';

class MapContainer extends StatefulWidget {
  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition:
            CameraPosition(target: LatLng(7.0, 4.5), zoom: 11.6),
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        onTap: (_) {
          Navigator.of(context).popAndPushNamed(MapScreen.routeName);
        },
      ),
    );
  }
}
