class UserModel {
  final String firebaseUid;
  final String firstName;
  final String lastName;
  final String fullName;
  final String email;
  final String gender;
  final String? avatarUrl;
  final String? mobileNumber;
  final int? familyId;
  final String? role;
  final String? familyName;
  final String? familyCode;
  final String? relationship;
  final String? systemRole;

  UserModel({
    required this.firebaseUid,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.email,
    required this.gender,
    this.avatarUrl,
    this.mobileNumber,
    this.familyId,
    this.role,
    this.familyName,
    this.familyCode,
    this.relationship,
    this.systemRole,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final family = json['family'] as Map<String, dynamic>?;
    final membership = json['membership'] as Map<String, dynamic>?;

    return UserModel(
      firebaseUid: json['firebaseUid'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      gender: json['gender'] ?? '',
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
      avatarUrl: json['avatarUrl'],
      mobileNumber: json['mobileNumber'],
      familyId: json['familyId'],
      role: json['role'],
      familyName: family?['familyName'],
      familyCode: family?['familyCode'],
      relationship: membership?['relationship'],
      systemRole: membership?['systemRole'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'firebaseUid': firebaseUid,
      'firstName': firstName,
      'lastName': lastName,
      'fullName': fullName,
      'email': email,
      'gender': gender,
      'avatarUrl': avatarUrl,
      'mobileNumber': mobileNumber,
      'familyId': familyId,
      'role': role,
      'family': {
        'familyName': familyName,
        'familyCode': familyCode,
      },
      'membership': {
        'relationship': relationship,
        'systemRole': systemRole,
      },
    };
  }
}