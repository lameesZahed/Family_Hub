import 'package:flutter/material.dart';

class FormComponent extends StatelessWidget {
  final String title;
  final String hint;
  const FormComponent({super.key, required this.title, required this.hint});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,style: TextStyle(
            fontSize: 14,
            color: Color(0xFF6E5C52)
          ),),
          SizedBox(height: 8,),
          TextFormField(
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 12,
                color: Color(0xFFACACAC)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFF308983).withOpacity(0.5)
                )
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Color(0xFF308983).withOpacity(0.5)
                  )
              )

            ),
          )
        ],
      ),
    );
  }
}
