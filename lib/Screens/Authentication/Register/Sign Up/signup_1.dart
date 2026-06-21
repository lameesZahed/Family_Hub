import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
// import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../../Bloc/Authentication/auth_bloc.dart';
import '../../../../Bloc/Authentication/auth_event.dart';
import '../../../../Bloc/Authentication/auth_state.dart';
import '../../../../Components/Authentication/password_validation.dart';
import '../../../../Components/Authentication/question.dart';
import '../../../../Components/Authentication/step_progress_indecator.dart';
import '../../../../Components/Authentication/text_field_custom.dart';
import '../../../../Components/Customized Buttons/button.dart';

class Signup1 extends StatefulWidget {
  final Function(int) onTap;
  final Function(String, String) onDataSaved;
  const Signup1({super.key, required this.onTap, required this.onDataSaved});

  @override
  State<Signup1> createState() => _SignupState();
}

class _SignupState extends State<Signup1> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  // Future<void> registerUser() async {
  //   print("Loading ");
  //
  //
  //   final url = Uri.parse('http://10.10.33.46:5000/signup');
  //   try {
  //     print(" Sending to server: $url");
  //
  //     final response = await http.post(
  //       url,
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({
  //         "firstName": firstNameController.text,
  //         "lastName": lastNameController.text,
  //         "gender": genderController.text,
  //         "mobile": phoneController.text,
  //         "dob": dobController.text,
  //         "email": emailController.text,
  //         "password": passwordController.text,
  //         "role": roleController.text,
  //       }),
  //     ).timeout(const Duration(seconds: 10));
  //
  //     print("📥 response from server: ${response.statusCode}");
  //
  //     if (response.statusCode == 201) {
  //       print("worked successfullyً");
  //     } else {
  //       print("unsuccessful ${response.body}");
  //     }
  //   } catch (e) {
  //     print("Big error $e");
  //   }
  // }
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: StepProgressIndecator(index: 1)),
            SizedBox(height: 8),
            Text(
              "Registration",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff9B4747),
              ),
            ),
            SizedBox(height: 24),
            TextFieldCustom(
              name: "Email",
              labelBehavior: FloatingLabelBehavior.always,
              controller: emailController,
              hint: "adams@examplepetstore.com",
              focusNode: emailFocusNode,
              nextFocusNode: passwordFocusNode,
            ), //Email
            TextFieldCustom(
              //Password
              name: "Password",
              onChanged: (value){
                setState(() {

                });
              },
              labelBehavior: FloatingLabelBehavior.always,
              controller: passwordController,
              hint: "********",
              secure: true,
              focusNode: passwordFocusNode,
              nextFocusNode: confirmPasswordFocusNode,
            ),
            PasswordValidation(password: passwordController.text),
            SizedBox(height: 8),
            TextFieldCustom(
              //Password
              name: "Confirm Password",
              labelBehavior: FloatingLabelBehavior.always,
              controller: confirmPasswordController,
              hint: "********",
              secure: true,
              focusNode: confirmPasswordFocusNode,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: check,
                  checkColor: Colors.white,
                  activeColor: Color(0xFF9B4747),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  side: BorderSide(color: Color(0xFF9B4747)),
                  onChanged: (value) {
                    setState(() {
                      check =! check;
                    });
                  },
                ),
                Text("I  agree with the",style: TextStyle(fontSize: 12,color: Color(0xFF9B4747),fontWeight: FontWeight.w400),),
                SizedBox(width: 8),
                TextButton(
                    onPressed: (){},
                    child: Text("Terms and Conditions",style: TextStyle(fontSize: 12,color: Color(0xFF308983).withOpacity(0.7),fontWeight: FontWeight.w600),)
                )
              ],
            ),
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is EmailAlreadyExists) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('This email is already registered. Please log in.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                } else if (state is EmailAvailable) {
                  widget.onDataSaved(emailController.text, passwordController.text);
                  widget.onTap(2);
                } else if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message), backgroundColor: Colors.red),
                  );
                }
              },
              builder: (context, state) {
                return Button(
                  text: state is AuthLoading ? "Checking..." : "Next",
                  onPressed: (state is AuthLoading)? null : () {
                    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please fill in all fields")),
                      );
                      return;
                    }
                    if (passwordController.text != confirmPasswordController.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Passwords do not match")),
                      );
                      return;
                    }
                    if (!emailController.text.contains('@') || !emailController.text.contains('.') || emailController.text.length < 20) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please enter a valid email address")),
                      );
                      return;
                    }
                    if (!check) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please agree to Terms and Conditions")),
                      );
                      return;
                    }
                    context.read<AuthBloc>().add(CheckEmailEvent(emailController.text.trim()));
                  },
                );
              },
            ),
            Question(
              question: "Already have account?",
              answer: "Log in",
              onPressed: () {
                widget.onTap(0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
