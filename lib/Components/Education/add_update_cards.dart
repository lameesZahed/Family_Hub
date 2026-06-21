import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Models/Education/task.dart';
import '../../Models/Education/task_type_for_overlay.dart';

class AddUpdateCards extends StatelessWidget {
  final String dataDetails; //name_data description_data
  final String type; //course project lesson
  final int lines;
  final int length;
  final String header; //Name Description
  AddUpdateCards({super.key, required this.dataDetails, required this.type, required this.lines, required this.length, required this.header});

  TextEditingController controller = TextEditingController();
  OutlineInputBorder borderDesign(bool focused) {
 return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(
      color: Color(0xff308983),
      width: (focused)?2:1,
    )
  );}




  @override
  Widget build(BuildContext context) {
    controller.text = controller.text+dataDetails;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical:8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$type $header",style: TextStyle(
            color: Color(0xff6E5C52),
            fontSize: 20,
          ),),
          SizedBox(height: 8,),
          TextFormField(
            controller: controller,
            maxLines: lines,
            maxLength: length,
            decoration: InputDecoration(
              hintText: "Enter $type $header",
              hintStyle: TextStyle(
                color: Color(0xffC4B7A6),
                fontSize: 12,
              ),
              focusedBorder: borderDesign(true),
              enabledBorder: borderDesign(false),
            )
          ),
        ],
      ),
    );
  }
}
