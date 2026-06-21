import 'package:dotted_border/dotted_border.dart';
import 'package:family_hub/Components/Lists/image_placeholder.dart';
import 'package:family_hub/Components/Lists/title_textfield.dart' show TitleTextfield;
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Models/Lists/lists_model.dart';
import 'package:flutter/material.dart';

class EditAddDialogBox extends StatelessWidget {
  final String? image;
  final String? name;
  final String? description;
  final String type;
   EditAddDialogBox({super.key, this.image, this.name, this.description, required this.type});


  TextEditingController nameText = TextEditingController();
  TextEditingController descriptionText = TextEditingController();


  @override
  Widget build(BuildContext context) {
    bool List_excist = ListModel().Lists[name] == null ? false : true;
    nameText.text = nameText.text+ (name??"");
    descriptionText.text = descriptionText.text+ (description??"");

    return Dialog(
      backgroundColor: Color(0xFFFFF4EA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Add $type",style: TextStyle(
                  color: Color(0xFF9B4747),
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 16,),
                ImagePlaceholder(image: image),
                SizedBox(height: 16,),
                TitleTextfield(input: "Name", max_length: 20, max_lines: 1, controller: nameText, type: type,),
                TitleTextfield(input: 'Description', max_length: 130, max_lines: 4, controller: descriptionText, type: type,),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Button(
                      text: (List_excist)?"Update":"Add",
                      onPressed: (){}
                  ),
                ),
            
            
              ],
            ),
          ),
        ),
      )

    );





  }





}
