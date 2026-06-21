import '../../Server/Authentication/api_client.dart';

class FamilyLocationModel {
  final String firebaseUid;
  final String name;
  final String? avatarUrl;
  final double lat;
  final double lng;
  final DateTime? capturedAtUtc;

  FamilyLocationModel({
    required this.firebaseUid,
    required this.name,
    this.avatarUrl,
    required this.lat,
    required this.lng,
    this.capturedAtUtc,
  });

  factory FamilyLocationModel.fromJson(Map<String, dynamic> json) {
    String? rawAvatar = json['avatarUrl'];
    String? fullAvatar;
    if (rawAvatar != null && rawAvatar.isNotEmpty) {
      fullAvatar = rawAvatar.startsWith('http')
          ? rawAvatar
          : '${ApiClient.baseUrl}$rawAvatar';
    }

    return FamilyLocationModel(
      firebaseUid: json['firebaseUid'] ?? json['memberId']?.toString() ?? '',
      name: json['fullName'] ?? json['name'] ?? '',
      avatarUrl: fullAvatar,
      lat: (json['lat'] ?? json['latitude'] ?? 0).toDouble(),
      lng: (json['lng'] ?? json['longitude'] ?? 0).toDouble(),
      // هنا المشكلة الأساسية: السيرفر بيبعت lastUpdatedUtc
      capturedAtUtc: json['capturedAtUtc'] != null
          ? DateTime.tryParse(json['capturedAtUtc'])
          : (json['lastUpdatedUtc'] != null
          ? DateTime.tryParse(json['lastUpdatedUtc'])
          : null),
    );
  }

  String get timeLabel {
    if (capturedAtUtc == null) return 'غير متوفر';
    final local = capturedAtUtc!.toLocal();
    final hour = local.hour % 12 == 0 ? 12 : local.hour % 12;
    final minute = local.minute.toString().padLeft(2, '0');
    final period = local.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}