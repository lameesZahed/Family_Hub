import 'package:flutter/material.dart';

class CustomeFloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  const CustomeFloatingButton({super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      backgroundColor: Color(0xFFC96868),
      child: Icon(icon, color: Colors.white),
    );
  }
}
