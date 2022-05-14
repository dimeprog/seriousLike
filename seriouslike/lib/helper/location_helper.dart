const GOOGLE_API_KEY = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';

class LocationHelper {
  static String generatePreviewImageUrl(
      {required double? long, required double? lat}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$long&zoom=13&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C40.702147,-74.015794&markers=color:green%7Clabel:G%7C40.711614,-74.012318&markers=color:red%7Clabel:C%7C$lat,$long&key=$GOOGLE_API_KEY';
  }
}
// 'https://maps.googleapis.com/maps/api/staticmap?center=${lat},${long}&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$long&key=$GOOGLE_API_KEY';