import '../../Models/Authentication/user_model.dart';

abstract class AuthEvent {}

class GetMeEvent extends AuthEvent {}

class UpdateProfileEvent extends AuthEvent {
  final String firebaseUid;
  final String fullName;
  final String gender;
  final String email;
  final String? avatarUrl;
  final String? mobileNumber;

  UpdateProfileEvent({
    required this.firebaseUid,
    required this.fullName,
    required this.gender,
    required this.email,
    this.avatarUrl,
    this.mobileNumber,
  });
}

class SignupEvent extends AuthEvent {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String gender;
  final String mobileNumber;
  final String dateOfBirth;
  // final String role;
  final String relation;


  SignupEvent({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.mobileNumber,
    required this.dateOfBirth,
    // required this.role,
    required this.relation,
  });
}

class CheckEmailEvent extends AuthEvent {
  final String email;
  CheckEmailEvent(this.email);
}

class LoadSavedUserEvent extends AuthEvent {
  final UserModel user;
  LoadSavedUserEvent(this.user);
}

class VerifyNewPasswordEvent extends AuthEvent {
  final String email;
  final String newPassword;
  VerifyNewPasswordEvent({required this.email, required this.newPassword});
}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  ForgotPasswordEvent(this.email);
}

class ResendPasswordResetEvent extends AuthEvent {
  final String email;
  ResendPasswordResetEvent(this.email);
}

class CheckEmailVerifiedEvent extends AuthEvent {}