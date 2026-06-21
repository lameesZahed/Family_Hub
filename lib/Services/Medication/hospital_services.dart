import '../../Models/Medication/hospitals_model.dart';
import '../../Server/Authentication/api_client.dart';

class HospitalService {
  Future<List<HospitalModel>> getNearbyHospitals({
    required double latitude,
    required double longitude,
    int limit = 5,
    int radiusKm = 10,
  }) async {
    final response = await ApiClient.dio.get(
      '/api/Medication/hospitals',
      queryParameters: {
        'lat': latitude,
        'lng': longitude,
        'limit': limit,
        'radiusKm': radiusKm,
      },
    );
    final hospitals = response.data['hospitals'] as List;
    return hospitals.map((e) => HospitalModel.fromJson(e)).toList();
  }
}