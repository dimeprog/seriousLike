// ignore_for_file: null_check_always_fails

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/place.dart';
import 'dart:io';
import '../helper/db_helper.dart';
import '../helper/location_helper.dart';

class GreatPlace with ChangeNotifier {
  List<Place> _items = [];
  //  getters
  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(File pickedImage, String imageTitle,
      PlaceLocation _selectedLocation) async {
    final address = await LocationHelper.generateGeoCodingAddress(
      _selectedLocation.lat,
      _selectedLocation.long,
    );
    final _updatedLocation = PlaceLocation(
      lat: _selectedLocation.lat,
      long: _selectedLocation.long,
      address: address.toString(),
    );
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: imageTitle,
      location: _updatedLocation,
    );
    _items.add(newPlace);
    notifyListeners();
    DbHelper.insert('user_place', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image!.path,
      'loc_lat': newPlace.location!.lat,
      'loc_long': newPlace.location!.long,
      'address': newPlace.location!.address,
    });
  }

  Future<void> fetchAndSetData() async {
    final dataList = await DbHelper.getData('user_place');
    _items = dataList
        .map(
          (item) => Place(
            id: item['id'],
            image: File(item['image']),
            title: item['title'],
            location: PlaceLocation(
              lat: item['loc_lat'],
              long: item['loc_long'],
              address: item['address'],
            ),
          ),
        )
        .toList();
    notifyListeners();
  }
}
