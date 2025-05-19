import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:luo3_app/services/auth_services.dart';

class LocationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthServices _auth = AuthServices();

  // 🔒 Permission + Current Position
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled.');
    }

    // Check for permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied');
    }

    // Get current position
    return await Geolocator.getCurrentPosition();
  }

  // 📍 Set location to Firestore
  Future<void> setCurrentLocation() async {
    Position position = await _determinePosition();

    await _firestore.collection('drivers').doc(_auth.getUid()).set({
      'userId': _auth.getUid(),
      'user': await _auth.getProfile(),
      'latitude': position.latitude,
      'longitude': position.longitude,
      'timestamp': FieldValue.serverTimestamp(),
    }, SetOptions(merge: true)); // merge = true ensures update or create
  }

  // 📡 Listen to location changes (device-side)
  Stream<Position> getRealTimePosition() {
    return Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10,
      ),
    );
  }

  // 🔁 Realtime Firestore updates (cloud-side)
  Stream<Map<String, dynamic>?> getLocationUpdates(String userId) {
    return _firestore
        .collection('drivers')
        .doc(userId)
        .snapshots()
        .map((snapshot) => snapshot.data());
  }
}
