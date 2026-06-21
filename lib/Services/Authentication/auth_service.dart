import 'package:firebase_auth/firebase_auth.dart';

import '../../Models/Authentication/user_model.dart';
import '../../Server/Authentication/api_client.dart';

class AuthService {

  Future<UserModel> getMe() async {
    final response = await ApiClient.dio.get('/api/Auth/me');
    return UserModel.fromJson(response.data);

  }



  Future<void> syncProfile({
    required String firebaseUid,
    required String firstName,
    required String lastName,
    required String email,
    required String gender,
    required String familyName,
    required String familyCode,
    required String relationship,
    required String systemRole,
    required bool isVerified,
  }) async {
    await ApiClient.dio.post('/api/Auth/sync-profile', data: {
      'firebaseUid': firebaseUid,
      'firstName':   firstName,
      'gender':      gender,
      'lastName':    lastName,
      'email':       email,
      'systemRole':  systemRole,
      'isVerified':  isVerified,
      'Family': {
        'familyName': familyName,
        'familyCode': familyCode,
      },
      'membership': {
        'relationship': relationship,
      },
    });
  }

  Future<void> sendPasswordResetEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  Future<void> updateProfile({
    required String firebaseUid,
    required String fullName,
    required String email,
    required String gender,
    String? avatarUrl,
    String? mobileNumber,
  }) async {
    await ApiClient.dio.put(
      '/api/Auth/profile/$firebaseUid',
      data: {
        'fullName':     fullName,
        'avatarUrl':    avatarUrl,
        'mobileNumber': mobileNumber,
        'email':        email,
        'gender':       gender,
      },
    );
  }



  Future<bool> isPasswordResetDone(String email) async {
    try {
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> checkEmailExists(String email) async {
    final response = await ApiClient.dio.get(
      '/api/Auth/email-exists',
      queryParameters: {'email': email},
    );
    return response.data == true || response.data['exists'] == true;
  }

  Future<void> signup({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String gender,
    required String mobileNumber,
    required String dateOfBirth,
    // required String role,
    required String relation,
  }) async {

    try{
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);


    final token = await credential.user!.getIdToken();
    final firebaseUid = credential.user!.uid;

    await ApiClient.setToken(token!);

    await ApiClient.dio.post(
      '/api/Auth/sync-profile',
      data: {
        'firebaseUid': firebaseUid,
        'firstName': firstName,
        'lastName': lastName,
        'gender': gender,
        'mobileNumber': mobileNumber,
        'dateOfBirth': dateOfBirth,
        'membership': {
          'relationship': relation,
        },
        'email': email,
        'isVerified': false,
        'avatarUrl': null,
      },
    );
    }
    on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception('This email is already registered. Please log in.');
        case 'weak-password':
          throw Exception('Password is too weak.');
        case 'invalid-email':
          throw Exception('Invalid email address.');
        default:
          throw Exception('Signup failed. Please try again.');
      }
    }
  }
}