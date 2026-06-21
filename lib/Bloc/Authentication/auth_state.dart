import '../../Models/Authentication/user_model.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}
class AuthLoading extends AuthState {}
class AuthSuccess extends AuthState {
  final UserModel user;
  AuthSuccess(this.user);
}
class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}
class EmailAvailable extends AuthState {}
class EmailAlreadyExists extends AuthState {}
class ForgotPasswordEmailNotFound extends AuthState {}
class ForgotPasswordEmailSent extends AuthState {}
class PasswordResetEmailResent extends AuthState {}
class EmailVerified extends AuthState {}
class EmailNotVerified extends AuthState {}
class NewPasswordVerified extends AuthState {}