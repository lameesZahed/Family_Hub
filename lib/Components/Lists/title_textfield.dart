import 'package:flutter/material.dart';

class TitleTextfield extends StatelessWidget {
  final String type;
  final String input;
  final int max_length;
  final int max_lines;
  final TextEditingController controller;
  const TitleTextfield({super.key, required this.input, required this.max_length, required this.max_lines, required this.controller, required this.type});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(input,style: TextStyle(
            color: Color(0xFF6E5C52),
            fontSize: 16,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 8,),
        TextFormField(
            controller: controller,
            maxLines: max_lines,
            maxLength: max_length,
            decoration: InputDecoration(
                hintText: "Enter $type $input",
                hintStyle: TextStyle(
                    color: Color(0xFFC4B7A6),
                    fontSize: 14,
                    fontWeight: FontWeight.w300
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: Color(0xFF308983),
                        width: 2
                    )
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                        color: Color(0xFF308983),
                        width: 1
                    )
                )
            ))
      ],
    );
  }
}




