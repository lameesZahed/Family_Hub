import 'package:flutter/material.dart';

import '../../../Models/Family Tree/family.dart';

class AdminOwnerMemberDialog extends StatelessWidget {
  final Roles role;
  AdminOwnerMemberDialog({super.key, required this.role});

  TextStyle textStyle = TextStyle(
    color: Color(0xff9B4747),
    fontWeight: FontWeight.normal
  );

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert,color: Color(0xff308983)),
        itemBuilder: (context)=>[
          PopupMenuItem(value: "View",child: Text("View",style: textStyle,),),
          if(role==Roles.Admin)
            PopupMenuItem(value: "Remove Admin",child: Text("Remove Admin",style: textStyle,)),
          if(role==Roles.Member)...[
            PopupMenuItem(value: "Make Admin", child: Text("Make Admin",style: textStyle,)),
            PopupMenuItem(value: "Remove",child: Text("Remove",style: TextStyle(color: Colors.red,fontWeight: FontWeight.normal))),
          ]
        ]
    );
  }
}
