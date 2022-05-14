import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../helper/location_helper.dart';

class LocationWigdet extends StatefulWidget {
  const LocationWigdet({Key? key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
            color: Colors.grey,
          )),
          child: _previewUrlImage == null
              ? const Text('no preview yet')
              : Image.network(
                  _previewUrlImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton.icon(
              label: const Text('Show current Location'),
              onPressed: _getCurrentLocation,
              icon: const Icon(Icons.map),
              textColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 10,
            ),
            RaisedButton.icon(
              label: const Text(' get location'),
              onPressed: () {},
              icon: const Icon(Icons.location_on),
              textColor: Theme.of(context).primaryColor,
            ),
          ],
        )
      ],
    );
  }
}
