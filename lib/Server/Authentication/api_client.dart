
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/Authentication/user_model.dart';

class ApiClient {
  static const String baseUrl =
      'https://familyhubserver20260620215639-g5ffbvfacthkfad4.uaenorth-01.azurewebsites.net';

  static Dio? dio_client;

  static Dio get dio {
    dio_client ??= Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    dio_client!.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      error: true,
    ));

    return dio_client!;
  }

  // static void setToken(String token) {
  //   dio_client?.options.headers['Authorization'] = 'Bearer $token';
  // }

  static Future<bool> init() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');
    if (token != null && token.isNotEmpty) {
      dio.options.headers['Authorization'] = 'Bearer $token';
      return true;
    }
    return false;
  }

  static Future<UserModel?> getFreshUser() async {
    try {
      final response = await dio.get('/api/Auth/me');
      final user = UserModel.fromJson(response.data);
      await saveUser(user);
      return user;
    } catch (e) {
      return await getSavedUser(); // fallback للـ cache لو فشل النداء
    }
  }

  static Future<void> setToken(String token) async {
    dio.options.headers['Authorization'] = 'Bearer $token';
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<void> saveUser(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_data', jsonEncode(user.toJson()));
  }

  static Future<UserModel?> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_data');
    if (userData != null) {
      return UserModel.fromJson(jsonDecode(userData));
    }
    return null;
  }

// امسح بيانات اليوزر عند الـ logout
  static Future<void> clearToken() async {
    dio.options.headers.remove('Authorization');
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_data');       // ← أضف السطر ده
  }

  // static void clearToken() {
  //   dio_client?.options.headers.remove('Authorization');
  // }

  // static Future<void> clearToken() async {
  //   dio.options.headers.remove('Authorization');
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('auth_token');
  // }
}