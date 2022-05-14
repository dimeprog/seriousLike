// ignore_for_file: null_check_always_fails

import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import '../models/place.dart';
import 'dart:io';
import '../helper/db_helper.dart';

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
    notifyListeners();
    DbHelper.insert('user_place', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image!.path,
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
            location: null,
          ),
        )
        .toList();
    notifyListeners();
  }
}
