import '../../Server/Authentication/api_client.dart';

class FamilyService {
  Future<Map<String, String>> createFamily(String familyName) async {
    final user = await ApiClient.dio.get('/api/Auth/me');
    final firebaseUid = user.data['firebaseUid'];

    final response = await ApiClient.dio.post('/api/Families/create', data: {
      'firebaseUid': firebaseUid,
      'familyName': familyName,
    });

    print('CREATE FAMILY RESPONSE: ${response.data}');

    return {
      'familyName': response.data['familyName'] ?? familyName,
      'familyCode': response.data['familyCode'] ?? '',
    };
  }

  Future<void> joinFamily(String familyCode, String relationship) async {
    final user = await ApiClient.dio.get('/api/Auth/me');
    final firebaseUid = user.data['firebaseUid'];

    await ApiClient.dio.post('/api/Families/join', data: {
      'firebaseUid': firebaseUid,
      'familyCode': familyCode,
      'relationship': relationship,
    });
  }
}