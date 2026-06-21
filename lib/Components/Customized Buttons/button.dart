import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const Button({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Color(0xFFC96868),
            fixedSize: Size(1000, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          )
        ),
        child: Text(text,style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          fontWeight: FontWeight.normal
        ),)
    );
  }
}
