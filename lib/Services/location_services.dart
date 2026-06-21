import 'package:location/location.dart' as loc;
import 'package:google_maps_flutter/google_maps_flutter.dart';



class LocationService {
  final loc.Location _locationService = loc.Location();

  Future<LatLng?> getCurrentLocation() async {
    bool serviceEnabled = await _locationService.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await _locationService.requestService();
      if (!serviceEnabled) return null;
    }

    loc.PermissionStatus permissionStatus = await _locationService.hasPermission();
    if (permissionStatus == loc.PermissionStatus.denied) {
      permissionStatus = await _locationService.requestPermission();
      if (permissionStatus != loc.PermissionStatus.granted) return null;
    }

    final loc.LocationData locationData = await _locationService.getLocation();
    if (locationData.latitude != null && locationData.longitude != null) {
      return LatLng(locationData.latitude!, locationData.longitude!);
    }
    return null;
  }

  // This returns a Stream so your UI can listen for movement
  Stream<loc.LocationData> get locationStream => _locationService.onLocationChanged;
}