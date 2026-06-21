import 'package:dio/dio.dart';
import '../../Models/Medication/medicine_model.dart';
import '../../Server/Authentication/api_client.dart';

class MedicineService {
  Future<List<MedicineModel>> getMedicines({required String firebaseUid}) async {
    final response = await ApiClient.dio.get(
      '/api/Medication/pharmacy',
      queryParameters: {'firebaseUid': firebaseUid},
    );
    final List data = response.data as List;
    return data.map((e) => MedicineModel.fromJson(e)).toList();
  }

  Future<MedicineModel> addMedicine({
    required String firebaseUid,
    required String name,
    required String description,
    required int quantity,
    DateTime? expiryDate,
    String notes = '',
    String? imagePath,
  }) async {
    final formData = FormData.fromMap({
      'FirebaseUid': firebaseUid,
      'Name': name,
      'Description': description,
      'Quantity': quantity,
      if (expiryDate != null) 'ExpiryDate': expiryDate.toIso8601String(),
      'Notes': notes,
      if (imagePath != null) 'image': await MultipartFile.fromFile(imagePath),
    });

    final response = await ApiClient.dio.post(
      '/api/Medication/pharmacy',
      data: formData,
      options: Options(contentType: 'multipart/form-data'),
    );

    return MedicineModel.fromJson(response.data);
  }

  Future<void> updateMedicine({
    required int id,
    required String firebaseUid,
    required String name,
    required String description,
    required int quantity,
    String? imageUrl,
    String? imagePath,
    DateTime? expiryDate,
    String notes = '',
  }) async {
    final Map<String, dynamic> dataMap = {
      'id': id,
      'firebaseUid': firebaseUid,
      'name': name,
      'description': description,
      'quantity': quantity,
      'notes': notes,
      if (expiryDate != null) 'expiryDate': expiryDate.toIso8601String(),
    };

    dynamic sendData;
    Options options;

    if (imagePath != null) {
      final formData = FormData.fromMap(dataMap);
      formData.files.add(MapEntry(
        'image',
        await MultipartFile.fromFile(imagePath),
      ));
      sendData = formData;
      options = Options(contentType: 'multipart/form-data');
    } else {
      dataMap['imageUrl'] = imageUrl ?? '';
      sendData = dataMap;
      options = Options(contentType: 'application/json');
    }

    await ApiClient.dio.put(
      '/api/Medication/pharmacy/$id',
      data: sendData,
      options: options,
    );
  }

  Future<void> deleteMedicine({
    required int id,
    required String firebaseUid,
  }) async {
    await ApiClient.dio.delete(
      '/api/Medication/pharmacy/$id',
      queryParameters: {'firebaseUid': firebaseUid},
    );
  }
}