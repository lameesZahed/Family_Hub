import 'package:flutter/material.dart';


class ReactionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const ReactionButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
        enableFeedback: true
      ),
        icon: Icon(icon,
          color: Color(0xff9B4747),
        ),
    );
  }
}
