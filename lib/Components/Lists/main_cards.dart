
import 'package:family_hub/Components/Lists/color_placeholder.dart';
import 'package:family_hub/Components/Lists/small_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../Models/Lists/lists_model.dart';
import '../../Screens/Lists/view_list.dart';
import 'edit_add_dialog_box.dart';


class MainCards extends StatelessWidget {
  final String? image;
  final String title;
  final int quantity;
  final int position;
  MainCards({super.key, required this.image, required this.title, required this.quantity,required this.position});




  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        dragDismissible: true,
        dismissible: DismissiblePane(onDismissed: () {  },key: UniqueKey(),),
        motion: DrawerMotion(),
        children: [
          SlidableAction(
            icon: Icons.edit,
            label: "Edit",
            backgroundColor: Color(0xFF308983),
            onPressed: (context){
              showDialog(
                  context: context,
                  builder: (context)=>EditAddDialogBox(
                    type: 'List',
                    image: image,
                    name: title,
                    description: ListModel().Lists[title]![0],
                  )
              );
            },
            flex: 2,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
          ),
          SlidableAction(
            icon: Icons.delete,
            label: "Delete",
            flex: 1,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            onPressed: (context){},
          )
        ],
      ),

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        ),
        color: Colors.white,
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          title: Text(title),
          titleTextStyle: TextStyle(
            color: Color(0xFF6E5C52),
              fontSize: 16
          ),
          subtitle: Text("$quantity items"),
          subtitleTextStyle: TextStyle(
            color: Color(0xFF6E5C52).withOpacity(0.5),
            fontSize: 14
          ),
          leading: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFF308983).withOpacity(0.7),
              ),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: (image!=null)?Image.asset(image!): Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        color: Color(0xFF308983).withOpacity(0.7),
                        width: 1,
                      ),
                      color: ColorPlaceholder().colors[position%ColorPlaceholder().colors.length] ,
                    ),
                  )
              ),
            ),
          ),
          trailing: SmallDialog(
            type: 'List',
            image: image,
            name: title,
            description: ListModel().Lists[title]![0],
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewList(title: title)));
          },

        )
      ),
    );
  }
}

