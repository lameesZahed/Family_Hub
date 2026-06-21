import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Server/Authentication/api_client.dart';
import '../../Services/Authentication/auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService _authService = AuthService();

  AuthBloc() : super(AuthInitial()) {

    on<GetMeEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await _authService.getMe();
        await ApiClient.saveUser(user);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthError('Error occurred'));
      }
    });
    on<UpdateProfileEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authService.updateProfile(
          firebaseUid: event.firebaseUid,
          fullName: event.fullName,
          avatarUrl: event.avatarUrl,
          mobileNumber: event.mobileNumber,
          gender: event.gender,
          email: event.email,
        );
        add(GetMeEvent());
      } catch (e) {
        emit(AuthError("Couldn't update profile"));
      }
    });

    on<ForgotPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final exists = await _authService.checkEmailExists(event.email);
        if (!exists) {
          emit(ForgotPasswordEmailNotFound());
        } else {
          await _authService.sendPasswordResetEmail(event.email);
          emit(ForgotPasswordEmailSent());
        }
      } catch (e) {
        emit(AuthError('Error'));
      }
    });

    on<CheckEmailEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final exists = await _authService.checkEmailExists(event.email);
        if (exists) {
          emit(EmailAlreadyExists());
        } else {
          emit(EmailAvailable());
        }
      } catch (e) {
        emit(AuthError('Could not verify email'));
      }
    });

    on<ResendPasswordResetEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authService.sendPasswordResetEmail(event.email);
        emit(PasswordResetEmailResent());
      } catch (e) {
        emit(AuthError('Failed'));
      }
    });

    on<LoadSavedUserEvent>((event, emit) {
      emit(AuthSuccess(event.user));
    });

    on<VerifyNewPasswordEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: event.email,
          password: event.newPassword,
        );
        emit(NewPasswordVerified());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
          emit(EmailNotVerified());
        } else {
          emit(AuthError('Error'));
        }
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await _authService.signup(
          email: event.email,
          password: event.password,
          firstName: event.firstName,
          lastName: event.lastName,
          gender: event.gender,
          mobileNumber: event.mobileNumber,
          dateOfBirth: event.dateOfBirth,
          // role: event.role,
          relation: event.relation,
        );
        await Future.delayed(const Duration(seconds: 2));
        final user = await _authService.getMe();
        await ApiClient.saveUser(user);
        emit(AuthSuccess(user));
      }  catch (e) {
      emit(AuthError(e.toString().replaceAll('Exception: ', '')));
    }
    });
  }

}