import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'edit_add_dialog_box.dart';

class MinorCards extends StatefulWidget {
  final String image;
  final String title;
  final String description;
  final bool isChecked;
   MinorCards({super.key, required this.image, required this.title, required this.description, required this.isChecked});

  @override
  State<MinorCards> createState() => _MinorCardsState();
}



class _MinorCardsState extends State<MinorCards> {
  late bool check;

  @override
  void initState() {
    check = widget.isChecked;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 4.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              icon: Icons.edit,
              label: "Edit",
              backgroundColor: Color(0xFF308983),
              onPressed: (context){
                showDialog(
                    context: context,
                    builder: (context)=>EditAddDialogBox(
                      type:  (widget.title == "To Do's")?"Task":"Item",
                      description: widget.description,
                      image: widget.image,
                      name: widget.title,
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

        key: UniqueKey(),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16)
            ),
            color: Colors.white,
            child: CheckboxListTile(
              checkColor: Colors.white,
              activeColor: Color(0xFF9B4747),
              side: BorderSide(
                color: Color(0xFF9B4747),
                width: 2
              ),
              // hoverColor: Color(0xFF9B4747),
              secondary:ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(widget.image),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)
              ),
              title: Text(widget.title,style: TextStyle(
                  color: Color(0xFF6E5C52),
                  fontSize: 16
              ),),
              subtitle: Text(widget.description,style: TextStyle(
                  color: Color(0xFF6E5C52).withOpacity(0.5),
                  fontSize: 14
              ),),
              value: check,
              onChanged: (value) {
                setState(() {
                  check = value!;
                });
              },
              // controlAffinity: ListTileControlAffinity.trailing,
            )
        ),
      ),
    );
  }
}

