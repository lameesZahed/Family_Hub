import '../../Models/Medication/doctors_model.dart';
import '../../Server/Authentication/api_client.dart';

class DoctorService {
  Future<List<DoctorModel>> getNearbyDoctors({
    required double latitude,
    required double longitude,
    int limit = 5,
    int radiusKm = 10,
  }) async {
    final response = await ApiClient.dio.get(
      '/api/Medication/doctors',
      queryParameters: {
        'lat': latitude,
        'lng': longitude,
        'limit': limit,
        'radiusKm': radiusKm,
      },
    );
    final doctors = response.data['doctors'] as List;
    return doctors.map((e) => DoctorModel.fromJson(e)).toList();
  }
}