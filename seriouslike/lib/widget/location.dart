import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../helper/location_helper.dart';
import '../screens/map_screen.dart';
import '../widget/map_container.dart';

class LocationWigdet extends StatefulWidget {
  @override
  State<LocationWigdet> createState() => _LocationWigdetState();
}

class _LocationWigdetState extends State<LocationWigdet> {
  String? _previewUrlImage;

  void _getCurrentLocation() async {
    final location = Location();
    final locData = await location.getLocation();
    final staticImageUrl = LocationHelper.generatePreviewImageUrl(
      long: locData.longitude,
      lat: locData.latitude,
    );
    setState(() {
      _previewUrlImage = staticImageUrl;
    });
  }

  Future<void> _isOnMap() async {
    final selectedLocation = await Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(isOnMapSelect: true),
      ),
    );
    if (selectedLocation == null) return;
    print(selectedLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MapContainer(),
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
        //       ? const Text('no preview yet')
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
              onPressed: _getCurrentLocation,
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
