import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:seriouslike/models/place.dart';
import '../helper/location_helper.dart';
import '../screens/map_screen.dart';
import '../widget/map_container.dart';
import 'package:geolocator/geolocator.dart';

class LocationWigdet extends StatefulWidget {
  final Function _selectedPlace;

  LocationWigdet(
    this._selectedPlace,
  );
  @override
  State<LocationWigdet> createState() => _LocationWigdetState();
}

class _LocationWigdetState extends State<LocationWigdet> {
  String? _previewUrlImage;
  // PlaceLocation mapLocation = PlaceLocation(
  //   lat: 37.3861,
  //   long: -122.08,
  // );
  // ignore: prefer_typing_uninitialized_variables
  var mapLocation;
  // //// dialogbox
  void _showDialogBox(err) {
    showDialog(
      context: context,
      builder: (
        context,
      ) =>
          AlertDialog(
        title: Text(
          err.toString(),
        ),
        actions: [
          FlatButton(
            child: const Text('okay'),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }

  void _showMapPreview(double lat, double long) {
    final staticImageUrl = LocationHelper.generatePreviewImageUrl(
      long: lat,
      lat: long,
    );
    setState(() {
      _previewUrlImage = staticImageUrl;
    });
  }

  // ///////////////////////////
  void _showMapContainerReview(double lat, double long) {
    final containerPreview = PlaceLocation(lat: lat, long: long);
    setState(() {
      mapLocation = containerPreview;
    });
  }

// ///////  get location from geolocator
  void _geolocatorCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition();
      _showMapContainerReview(position.latitude, position.longitude);
    } catch (err) {
      _showDialogBox(err);
    }
  }

  void _getCurrentLocation() async {
    try {
      final location = Location();
      final locData = await location.getLocation();
      // _showMapPreview(locData.latitude!, locData.longitude!);

      _showMapContainerReview(locData.latitude!, locData.longitude!);
    } catch (err) {
      _showDialogBox(err);
    }
  }

  Future<void> _isOnMap() async {
    final LatLng selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(isOnMapSelect: true),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    // _showMapPreview(
    //   selectedLocation.latitude,
    //   selectedLocation.longitude,
    // );
    _showMapContainerReview(
      selectedLocation.latitude,
      selectedLocation.longitude,
    );
    setState(() {
      widget._selectedPlace(
          selectedLocation.latitude, selectedLocation.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ////////////////////////
        Container(
          height: 300,
          alignment: Alignment.center,
          width: double.infinity,
          color: mapLocation == null ? Colors.grey : null,
          child: mapLocation == null
              ? const Text(
                  'No location added yet',
                  style: TextStyle(
                    // backgroundColor: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                )
              : MapContainer(mapLocation),
        ),
        // /////////////////
        // MapContainer(
        //   mapLocation == null
        //       ? PlaceLocation(
        //           lat: 37.3861,
        //           long: -122.08,
        //         )
        //       : mapLocation,
        // ),
        // Container(
        //   alignment: Alignment.center,
        //   width: double.infinity,
        //   height: 200,
        //   decoration: BoxDecoration(
        //       border: Border.all(
        //     width: 1,
        //     color: Colors.grey,
        //   )),
        //   child: _previewUrlImage == null
        // ? const Text('no preview yet')
        //       : Image.network(
        //           _previewUrlImage!,
        //           fit: BoxFit.cover,
        //           width: double.infinity,
        //         ),
        // ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton.icon(
              label: const Text(
                'Show  Location',
                softWrap: true,
              ),
              onPressed: _geolocatorCurrentLocation,
              icon: const Icon(Icons.map),
              textColor: Theme.of(context).primaryColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            const SizedBox(
              width: 10,
            ),
            RaisedButton.icon(
              label: const Text(
                'show map',
                softWrap: true,
              ),
              onPressed: _isOnMap,
              icon: const Icon(Icons.location_on),
              textColor: Theme.of(context).primaryColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ],
        )
      ],
    );
  }
}
