import 'package:flutter/foundation.dart';
import 'dart:io';

class PlaceLocation {
  final double lat;
  final double long;
  final String address;

  const PlaceLocation({
    this.address = '',
    required this.lat,
    required this.long,
  });
}

class Place {
  final String? id;
  final String? title;
  final PlaceLocation? location;
  final File? image;

  Place({
    required this.id,
    required this.image,
    required this.title,
    required this.location,
  });
}
