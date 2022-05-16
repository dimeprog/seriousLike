const GOOGLE_API_KEY = 'AIzaSyAbZVvHQ1A6pi-Cp4R80jk_2c1JrZsJ1cs';

class LocationHelper {
  static String generatePreviewImageUrl(
      {required double? long, required double? lat}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C$lat,$long&key=$GOOGLE_API_KEY';
  }
}


// https://maps.googleapis.com/maps/api/staticmap?center=Brooklyn+Bridge,New+York,NY&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C40.718217,-73.998284&key=AIzaSyAbZVvHQ1A6pi-Cp4R80jk_2c1JrZsJ1cs