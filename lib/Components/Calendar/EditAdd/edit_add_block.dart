import 'package:flutter/material.dart';
class EditAddBlock extends StatelessWidget {
  final String text;
  final Widget card;

  const EditAddBlock(
      {super.key, required this.text, required this.card,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: TextStyle(
              color: Color(0xFF6E5C52),
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
          ),
          SizedBox(height: 8),
          card,
        ],
      ),
    );
  }
}
