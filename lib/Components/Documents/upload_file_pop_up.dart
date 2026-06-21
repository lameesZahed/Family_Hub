import 'package:dotted_border/dotted_border.dart';
import 'package:family_hub/Components/Customized%20Buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Customized Buttons/button.dart';
class UploadFilePopUp extends StatelessWidget {
  const UploadFilePopUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Color(0xFFFFF4EA),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            )
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Upload Document",style: TextStyle(
                fontSize: 20,
                color: Color(0xFF9B4747),
              )),
              SizedBox(height: 24,),
              uploadPhoto(),
              SizedBox(height: 16,),
              Button(text: "Upload", onPressed: (){}),
              SizedBox(height: 8,),
              SecondaryButton(text: "Cancel", onPressed: (){}),
              SizedBox(height: 40,),

            ]
        )
    );
  }


  Widget uploadPhoto(){
    return SizedBox(
      width: double.infinity,
      height: 184,
      child: DottedBorder(
          options: RoundedRectDottedBorderOptions(
            color: Color(0xFF308983),
            strokeWidth: 1,
            strokeCap: StrokeCap.round,
            dashPattern: [5, 5],
            radius: Radius.circular(16),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/Icons/file.svg"),
                SizedBox(height: 8,),
                Text("Drag and Drop Files here or",style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF6E5C52),
                ),),
                SizedBox(height: 16,),
                OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Color(0xFF6E5C52),
                      textStyle: TextStyle(
                        fontSize: 14,
                      ),
                      side: BorderSide(
                          color: Color(0xFF6E5C52)
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)
                      )
                  ),
                  child: Text("Browse Files"),
                )

              ],
            ),
          )
      ),
    );
  }


}
