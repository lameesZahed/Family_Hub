import 'package:flutter/material.dart';

class DetailsBlock extends StatelessWidget {
  final String title;
  final String hint;
  final int maxLines;
  final int length;
  // final String? description;
  final TextEditingController controller;
   DetailsBlock({super.key,required String this.title,required String this.hint,required int this.maxLines,required int this.length, required this.controller});

  // TextEditingController controller = TextEditingController();
  // TextEditingController recipe_description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ //17 title lines
          Text(title,style: TextStyle(
              color: Color(0xFF9B4747),
              fontSize: 16,
              fontWeight: FontWeight.normal
          ),),
          SizedBox(height: 8,),
          TextFormField(
            controller: controller,
              maxLines: maxLines,
              maxLength: length,
              decoration: InputDecoration(
                  hintText: hint,
              )
          )
        ],
      ),
    );
  }
}
