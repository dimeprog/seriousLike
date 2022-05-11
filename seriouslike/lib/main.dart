import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:theme/theme.dart';
import '../providers/great_place.dart';
import '../screens/place_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GreatPlace(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Quicksand',
          iconTheme: const IconThemeData(
            color: Color(0xFFF57AA3),
          ),
          primarySwatch: Colors.indigo,
          accentColor: Colors.amber,
          hoverColor: const Color(0xFF87D2F5),
          errorColor: const Color(0xFFCC4D4D),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.apply(
                  fontFamily: 'Raleway',
                  bodyColor: const Color(0xFFF8BBD0),
                ),
          ),
        ),
        home: PlaceListScreen(),
      ),
    );
  }
}


// button: const TextStyle(
                  //   fontFamily: 'Raleway',
                  //   fontWeight: FontWeight.w500,
                  //   fontSize: 20,
                  //   color: Color(0xFFC96ADA),
                  // ),
                  // bodyLarge: const TextStyle(
                  //     fontSize: 26,
                  //     fontFamily: 'RobotoCondensed',
                  //     color: Color(0xFFF8BBD0),
                  //     fontWeight: FontWeight.bold),
                  // bodyMedium: const TextStyle(
                  //   color: Color(0xFFF8BBD0),
                  //   fontFamily: 'Raleway',
                  //   fontWeight: FontWeight.w500,
                  //   fontSize: 20,
                  // ),
                  // bodySmall: const TextStyle(
                  //   color: Color(0xFFF8BBD0),
                  //   fontFamily: 'OpenSans',
                  //   fontWeight: FontWeight.normal,
                  //   fontSize: 17,
                  // ),