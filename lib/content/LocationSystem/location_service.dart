import 'dart:async';

import 'package:absen_polinema/content/LocationSystem/user_location.dart';
import 'package:location/location.dart';

// Kelas layanan lokasi untuk memantau dan memancarkan perubahan lokasi
class LocationService{
  Location location = Location(); // Membuat instance dari kelas Location
  StreamController<UserLocation> _locationStreamController = StreamController<UserLocation>();
  Stream<UserLocation> get locationStream => _locationStreamController.stream;

  LocationService(){
    location.requestPermission().then((permissionStatus) {
      if(permissionStatus == PermissionStatus.granted){
        location.onLocationChanged.listen((locationData) {
          _locationStreamController.add(UserLocation(
            latitude: locationData.latitude ?? 0.0, 
            longitude: locationData.longitude ?? 0.0,
          ));
        });
      }
    });
  }

  void dispose() => _locationStreamController.close();
}