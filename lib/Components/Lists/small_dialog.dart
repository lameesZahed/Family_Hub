import 'package:family_hub/Components/Lists/edit_add_dialog_box.dart';
import 'package:flutter/material.dart';

class SmallDialog extends StatelessWidget {
  final String? image;
  final String? name;
  final String? description;
  final String type;
  const SmallDialog({super.key, this.image, this.name, this.description, required this.type});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(

      icon: Icon(Icons.more_vert),
      onSelected: (value){
        if(value == "Edit"){
          showDialog(
              context: context,
              builder: (context)=>EditAddDialogBox(
                type: 'List',
                image: image,
                name: name,
                description: description,
              )
          );
        }
        else if(value == "Delete"){

        }
      },
        itemBuilder: (context) =><PopupMenuEntry>[
         const PopupMenuItem(
            value: "Edit",
            child: Text("Edit",style: TextStyle(
              color: Color(0xFF6E5C52)
            ),),
            // onTap: (){},
          ),
         const PopupMenuDivider(
             height: 1,
             // color: Color(0xFF308983)
         ),
         const PopupMenuItem(
            value: "Delete",
            child: Text("Delete",style: TextStyle(
              color: Color(0xFFA9372C)
            ),),
            // onTap: (){},
          ),

        ]
    );
  }
}
