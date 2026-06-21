import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String? image;
  const ImagePlaceholder({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    bool image_excist = image == null ? false : true;
    return Center(
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          color: Color(0xFF308983),
          strokeWidth: 2,
          strokeCap: StrokeCap.round,
          dashPattern: [8, 6],
          radius: Radius.circular(16),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          width: double.infinity,
            child: (image_excist)?
            ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(image!,height: 128,)
            ):
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.add_photo_alternate_outlined,size: 48,color: Colors.black,),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: (){},
                        child: Text("Add Cover Photo",style: TextStyle(
                          color: Color(0xFF6E5C52),
                          fontSize: 12,
                        ),)
                    ),
                  ),
                  Text("(up to 12 Mb)",style: TextStyle(
                    color: Color(0xFF6E5C52),
                    fontSize: 8,
                  ),)
                ],
              ),
            )

        ) ,
      ),
    );
  }
}



