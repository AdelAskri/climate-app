import 'package:geolocator/geolocator.dart';

class Location {
  double latitude=0;
  double longitude=0;

  Location();

  Future<void> getLocation() async {
    try {
      print('getting location...');
      Position position = await Geolocator.getCurrentPosition(
          forceAndroidLocationManager: true,
          desiredAccuracy: LocationAccuracy.lowest);
      latitude=position.latitude;
      longitude=position.longitude;
    } catch (e) {
      print('error!');
    }
  }
}
