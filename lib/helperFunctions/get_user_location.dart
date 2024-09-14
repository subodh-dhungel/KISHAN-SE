import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

Future<String> getUserLocationShortForm() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if location services are enabled
  try{
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return 'location disabled';
    }
  }catch(e){
    return "Enable location";
  }

  // Check for location permissions
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return 'Denied';
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return 'Permanently Denied';
  }

  // Get the current location
  Position position = await Geolocator.getCurrentPosition();

  // Get the place name from the coordinates
  List<Placemark> placemarks = await placemarkFromCoordinates(
    position.latitude,
    position.longitude,
  );

  // Return the first place name found, adjusted for brevity
  if (placemarks.isNotEmpty) {
    Placemark place = placemarks[0];
    String shortLocation = '${place.subLocality ?? ''}, ${place.subAdministrativeArea ?? ''}';
    return shortLocation.trim().isEmpty ? 'Unknown' : shortLocation;
    
  } else {
    return 'No location found';
  }
}