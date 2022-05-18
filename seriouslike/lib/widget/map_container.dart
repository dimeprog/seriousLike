import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:seriouslike/models/place.dart';
import 'package:seriouslike/screens/map_screen.dart';

class MapContainer extends StatefulWidget {
  final PlaceLocation? _pickedMapLocation;
  MapContainer(this._pickedMapLocation);

  @override
  State<MapContainer> createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.hybrid,
      initialCameraPosition: CameraPosition(
        target: widget._pickedMapLocation == null
            ? const LatLng(
                37.3861,
                -122.08,
              )
            : LatLng(
                widget._pickedMapLocation!.lat,
                widget._pickedMapLocation!.long,
              ),
        zoom: 16,
      ),
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      onTap: (_) {
        Navigator.of(context).pushNamed(MapScreen.routeName);
      },
    );
  }
}
