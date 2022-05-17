import 'dart:io';

import 'package:flutter/material.dart';
import 'package:seriouslike/models/place.dart';
import 'package:seriouslike/widget/image_input.dart';
import 'package:provider/provider.dart';
import '../widget/location.dart';
import '../providers/great_place.dart';
import '../models/place.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);
  static const routeName = '/add-place';

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _pickedLocation;

  // /////////////////////////
  void _selectedImage(File? SnapImage) {
    _pickedImage = SnapImage;
  }

  void _selectPlace(double lat, double long) {
    _pickedLocation = PlaceLocation(lat: lat, long: long);
  }

  void _saveSelectedImage() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _pickedLocation == null) return;
    Provider.of<GreatPlace>(context, listen: false)
        .addPlace(_pickedImage!, _titleController.text, _pickedLocation!);
    Navigator.of(context).pop();
  }

  // function to select place

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Place'),
      ),
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  left: 10,
                  right: 10,
                ),
                child: Column(children: [
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      label: Text(
                        'Title',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ImageInput(_selectedImage),
                  const SizedBox(
                    height: 15,
                  ),
                  LocationWigdet(_selectPlace),
                ]),
              ),
              const SizedBox(
                height: 10,
              ),
              RaisedButton.icon(
                icon: const Icon(Icons.add),
                color: const Color(0xFFF3CB51),
                textColor: Color.fromARGB(255, 230, 4, 79),
                onPressed: _saveSelectedImage,
                elevation: 0,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: const Text(
                  'Add place',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
