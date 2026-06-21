import 'package:flutter/material.dart';

class PasswordValidation extends StatefulWidget {
  final String password;
  const PasswordValidation({super.key, required this.password});

  @override
  State<PasswordValidation> createState() => _PasswordValidationState();
}

class _PasswordValidationState extends State<PasswordValidation> {
   bool c1=false,c2=false,c3=false,c4=false;

  List <String> conditions = [
    "At least 8 character",
    "At least one capital letter",
    "At least one number",
    "At least one special character"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        passwordDesign(
          condition: conditions[0],
          validate: widget.password.length>=8,
        ),
        passwordDesign(
          condition: conditions[1],
          validate: widget.password.contains(RegExp(r'[A-Z]')),
        ),
        passwordDesign(
          condition: conditions[2],
          validate: widget.password.contains(RegExp(r'[0-9]')),
        ),
        passwordDesign(
          condition: conditions[3],
          validate: widget.password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
        ),
      ],
    );
  }

  Widget passwordDesign({
    required String condition,
    required bool validate
  }) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
              (validate)?Icons.check:Icons.close,
              size: 16,
              color:(validate)?Colors.green:Colors.red
          ),
          SizedBox(width: 8),
          Text(condition, style: TextStyle(
              color: (validate)?Colors.green:Colors.red
          )),
        ],
      ),
    );
  }
}
