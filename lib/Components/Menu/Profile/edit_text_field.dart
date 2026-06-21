import 'package:flutter/material.dart';
class EditTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;

  const EditTextField({super.key, required this.label, required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: label,
            hintText: hint ,
        ),
      ),
    );
  }
}
