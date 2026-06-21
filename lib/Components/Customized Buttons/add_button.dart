import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      shape: CircleBorder(),
      backgroundColor: Color(0xFFC96868),
      child: Icon(Icons.add, color: Colors.white),
    );
  }
}
