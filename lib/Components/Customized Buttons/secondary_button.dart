import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const SecondaryButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: Colors.transparent,
            fixedSize: Size(1000, 48),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
          side: BorderSide(
            color: Color(0xFFC96868),
          )
        ),
        child: Text(text,style: TextStyle(
            color: Color(0xFF1A202C),
            fontSize: 16,
          fontWeight: FontWeight.normal
        ),)
    );
  }
}
