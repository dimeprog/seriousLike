// ignore_for_file: null_check_always_fails

import 'package:flutter/foundation.dart';
import '../models/place.dart';
import 'dart:io';

class GreatPlace with ChangeNotifier {
  List<Place> _items = [];
  //  getters
  List<Place> get items {
    return [..._items];
  }

  void addPlace(File pickedImage, String imageTitle) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      image: pickedImage,
      title: imageTitle,
      location: null,
    );
    _items.add(newPlace);
  }
}
