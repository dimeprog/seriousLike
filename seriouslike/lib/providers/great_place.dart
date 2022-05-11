import 'package:flutter/foundation.dart';
import '../models/place.dart';

class GreatPlace with ChangeNotifier {
  List<Place> _items = [];
  //  getters
  List<Place> get items {
    return [..._items];
  }
}
