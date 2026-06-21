import 'package:flutter/material.dart';
class Question extends StatelessWidget {
  final String question;
  final String answer;
  final VoidCallback onPressed;
  const Question({super.key, required this.question, required this.answer, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(question,style: TextStyle(
              color: Color(0xFF9B4747).withOpacity(0.7),
            fontSize: 12,
            fontWeight: FontWeight.w400
          )),
          TextButton(
              onPressed: onPressed,
              child: Text(answer,style: TextStyle(
                  color: Color(0xFF308983).withOpacity(0.7),
                fontSize: 12,
                  fontWeight: FontWeight.w600
              ))
          )
        ],
      ),
    );
  }
}
