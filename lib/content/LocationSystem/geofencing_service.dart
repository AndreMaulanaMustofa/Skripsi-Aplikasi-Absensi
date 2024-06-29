import 'dart:math' as Math;

class GeofenceHaversine{
  static bool isInsideGeofence(double userLatitude, double userLongitude) {
      double geofenceLatitude = -7.94386; // Ganti dengan nilai latitude zona geofence Anda
      double geofenceLongitude = 112.61476; // Ganti dengan nilai longitude zona geofence Anda
      double radiusMeter = 55.0; // Ganti dengan nilai radius zona geofence Anda

      // Menghitung jarak antara lokasi pengguna dan pusat geofence
      double distance = calculateDistance(userLatitude, userLongitude, geofenceLatitude, geofenceLongitude);

      // Memeriksa apakah pengguna berada di dalam zona geofence
      return distance <= radiusMeter;
    }

    // Fungsi untuk menghitung jarak antara dua koordinat dalam meter
  static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
      const double radiusEarth = 6371000; // Radius Bumi dalam meter

      // Mengubah perbedaan lintang dan bujur dari derajat ke radian
      double dLat = _degreesToRadians(lat2 - lat1);
      double dLon = _degreesToRadians(lon2 - lon1);

      // Menggunakan rumus Haversine untuk menghitung jarak
      double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
          Math.cos(_degreesToRadians(lat1)) *
              Math.cos(_degreesToRadians(lat2)) *
              Math.sin(dLon / 2) *
              Math.sin(dLon / 2);

      double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
      
      // Mengalikan jarak sudut dengan radius bumi untuk mendapatkan jarak dalam meter
      return radiusEarth * c;
    }

  // Metode untuk mengubah derajat ke radian
  static double _degreesToRadians(double degrees) {
      return degrees * (Math.pi / 180);
    }
}
