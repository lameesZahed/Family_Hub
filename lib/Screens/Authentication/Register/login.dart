import 'package:family_hub/Components/Authentication/question.dart';
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Components/Authentication/text_field_custom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/Authentication/auth_bloc.dart';
import '../../../Bloc/Authentication/auth_event.dart';
import '../../../Bloc/Authentication/auth_state.dart';
import '../../../Server/Authentication/api_client.dart';

class Login extends StatefulWidget {
  final Function (int) onTap;
  Login({super.key, required this.onTap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode();

  final passwordFocusNode = FocusNode();

  bool isLoading = false;

  String errorMessage = '';

  Future<void> handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty) {
      // setState(() => errorMessage = 'يرجى ملء جميع الحقول');
      return;
    }

    setState(() => isLoading = true);

    try {
      // 1) تسجيل الدخول في Firebase
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // 2) جيبي الـ ID Token وحطيه في الـ ApiClient عشان كل الريكوستات الجاية تبقى Authenticated
      final idToken = await credential.user?.getIdToken();
      if (idToken == null) {
        throw Exception('فشل الحصول على بيانات تسجيل الدخول');
      }
      ApiClient.setToken(idToken);

      if (mounted) {
        context.read<AuthBloc>().add(GetMeEvent());
      }
    } on FirebaseAuthException catch (e) {
      setState(() => isLoading = false);
      String message = 'Something went wrong';
      if (e.code == 'user-not-found') {
        message = "Account doesn't exist";
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        message = "Password is incorrect";
      } else if (e.code == 'invalid-email') {
        message = 'Email is invalid';
      } else if (e.code == 'user-disabled') {
        message = 'Account is disabled';
      } else if (e.code == 'too-many-requests') {
        message = 'Try again later';
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
      }
    } catch (e) {
      setState(() => isLoading = false);
      if (mounted) {
        print(e.toString());

    ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }


    @override
    @override
    Widget build(BuildContext context) {
      return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            setState(() => isLoading = false);
            Navigator.pushNamedAndRemoveUntil(
              context,
              'Home',
                  (route) => false,
            );
          } else if (state is AuthError) {
            setState(() => isLoading = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthLoading) {
            setState(() => isLoading = true);
          }
        },
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 16),
              TextFieldCustom(
                name: "Email",
                labelBehavior: FloatingLabelBehavior.always,
                hint: "Enter your email",
                controller: emailController,
                focusNode: emailFocusNode,
                nextFocusNode: passwordFocusNode,
                keyboardType: TextInputType.emailAddress,
              ),
              TextFieldCustom(
                name: "Password",
                labelBehavior: FloatingLabelBehavior.always,
                hint: "Enter your password",
                secure: true,
                controller: passwordController,
                focusNode: passwordFocusNode,
                keyboardType: TextInputType.visiblePassword,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'Forget Password');
                },
                child: Text(
                  "Forget Password?",
                  style: TextStyle(color: const Color(0xFF308983).withOpacity(0.7)),
                ),
              ),
              const SizedBox(height: 64),
              Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : Button(text: "Log in", onPressed: handleLogin),
              ),
              Question(
                question: "Don't have account?",
                answer: "Sign up",
                onPressed: () {
                  widget.onTap(1);
                },
              ),
            ],
          ),
        ),
      );
    }
}


