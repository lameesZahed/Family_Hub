import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class RecipeDetailsImage extends StatelessWidget {
  final String? image;
  const RecipeDetailsImage({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            color: Color(0xFF308983),
            strokeWidth: 2,
            stackFit: StackFit.loose,
            strokeCap: StrokeCap.round,
            dashPattern: [8, 6],
            radius: Radius.circular(16),
            // strokeCap: StrokeCap.square
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
            ),
            width: double.infinity,
            child: (image == null)
                ? Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_photo_alternate,
                          color: Colors.black,
                          size: 56,
                        ),
                        SizedBox(height: 16,),
                        Text(
                          "Add Cover Photo",
                          style: TextStyle(
                            color: Color(0xFF6E5C52),
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(height: 8,),
                        Text(
                          "(up to 12 Mb)",
                          style: TextStyle(
                            color: Color(0xFF6E5C52),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  )
                : Image.asset(image!, height: 160, fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
