import 'package:family_hub/Components/Authentication/text_field_custom.dart';
import 'package:flutter/material.dart';

import '../../../Components/Authentication/password_validation.dart';
import '../../../Components/Customized Buttons/button.dart';

class ResetPassword extends StatefulWidget {
  ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final newPasswordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    newPasswordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Reset Password",
                  style: TextStyle(
                    color: Color(0xFF9B4747),
                    fontSize: 24,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Enter your new password make sure to add capital letter, numbers, and special character to secure your password",
                  style: TextStyle(color: Color(0xFFC4B7A6), fontSize: 18,fontWeight: FontWeight.normal),
                ),
                SizedBox(height: 16),
                TextFieldCustom(
                  //Password
                  name: "Password",
                  labelBehavior: FloatingLabelBehavior.always,
                  controller: newPasswordController,
                  hint: "********",
                  secure: true,
                  focusNode: newPasswordFocusNode,
                  nextFocusNode: confirmPasswordFocusNode,
                ),
                PasswordValidation(password: newPasswordController.text,),
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
                SizedBox(height: 210),
                Button(
                  text: "Confirm",
                  onPressed: () {
                    Navigator.pushNamed(context, 'Family ID');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



