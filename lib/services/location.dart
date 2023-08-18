import 'package:geolocator/geolocator.dart';

class Location {
  double? longitude;
  double? latitude;

  Future<void> getCurrentLocation() async {
    try {
      bool isLocationServiceEnabled  = await Geolocator.isLocationServiceEnabled();

      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);

      latitude = position.latitude ;
      longitude = position.longitude ;
      print(position);
    } catch(e) {
      await Geolocator.openAppSettings();
      await Geolocator.openLocationSettings();
      print(e);
    }
  }

}