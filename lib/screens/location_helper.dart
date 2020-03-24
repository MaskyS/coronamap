import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as Geo;

abstract class LocationHelper {
  static Future<String> getAddressFromLatLng(
      double latitude, double longitude) async {
    try {
      final geolocator = Geolocator()..forceAndroidLocationManager;

      List<Placemark> p =
          await geolocator.placemarkFromCoordinates(latitude, longitude);

      Placemark place = p[0];

      return "${place.subThoroughfare}, ${place.thoroughfare}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}";
    } catch (e) {
      print(e);
      return null;
    }
  }

  static Future<Geo.LocationData> getCurrentLocation() async {
    Geo.Location location = Geo.Location();
    bool _serviceEnabled;

    _serviceEnabled = await location.serviceEnabled();
    do {
      _serviceEnabled = await location.requestService();
    } while (!_serviceEnabled);

    return await location.getLocation();
  }
}
