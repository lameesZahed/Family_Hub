import '../../Models/Location/location_model.dart';
import '../../Server/Authentication/api_client.dart';

class LocationApiService {
  Future<void> sendMyLocation({
    required String firebaseUid,
    required double lat,
    required double lng,
    double accuracy = 0,
  }) async {
    await ApiClient.dio.post(
      '/api/Locations/my',
      data: {
        'firebaseUid': firebaseUid,
        'lat': lat,
        'lng': lng,
        'accuracy': accuracy,
        'capturedAtUtc': DateTime.now().toUtc().toIso8601String(),
      },
    );
  }

  Future<List<FamilyLocationModel>> getFamilyLocations({
    required String firebaseUid,
  }) async {
    final response = await ApiClient.dio.get('/api/Locations/family/$firebaseUid');
    final List data = response.data as List;
    return data.map((e) => FamilyLocationModel.fromJson(e)).toList();
  }
}