import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Components/Authentication/text_field_custom.dart';
import 'package:family_hub/Screens/Authentication/New%20Password/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/Authentication/auth_bloc.dart';
import '../../../Bloc/Authentication/auth_event.dart';
import '../../../Bloc/Authentication/auth_state.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordEmailSent) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Otp(email: emailController.text),
            ),
          );
        } else if (state is ForgotPasswordEmailNotFound) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Email not found'),
              backgroundColor: Colors.red,
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/Images/Placeholder Circle.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Forget Password",
                    style: TextStyle(
                      color: Color(0xFF9B4747),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 72),
                  TextFieldCustom(
                    name: "Email",
                    labelBehavior: FloatingLabelBehavior.always,
                    hint: "Enter your email",
                    controller: emailController,
                    focusNode: emailFocusNode,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 249),
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const CircularProgressIndicator();
                      }
                      return Button(
                        text: 'Continue',
                        onPressed: () {
                          final email = emailController.text.trim();
                          if (email.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('من فضلك أدخل الإيميل')),
                            );
                            return;
                          }
                          context.read<AuthBloc>().add(ForgotPasswordEvent(email));
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}