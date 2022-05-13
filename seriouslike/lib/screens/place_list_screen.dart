import 'package:flutter/material.dart';
import 'package:seriouslike/providers/great_place.dart';
import '../screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlaceListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final PlaceData = Provider.of<GreatPlace>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Your place',
          // style: Theme.of(context).textTheme.bodyLarge,
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Consumer<GreatPlace>(
        child: const Center(
          child: Text('no place aded yet'),
        ),
        builder: ((context, PlaceData, ch) => PlaceData.items.length <= 0
            ? ch!
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (ctx, i) => ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(
                            PlaceData.items[i].image!,
                          ),
                        ),
                        title: Text(
                          PlaceData.items[i].title!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'RobotoCondensed',
                            fontSize: 20,
                          ),
                        ),
                      ),
                      itemCount: PlaceData.items.length,
                    ),
                  )
                ],
              )),
      ),
    );
  }
}
