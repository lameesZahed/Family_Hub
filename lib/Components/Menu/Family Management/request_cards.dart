import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Models/Family Tree/family.dart';
import 'family_icons.dart';

class RequestCards extends StatelessWidget {
  final String memberName;
  final Family memberRelation;
  const RequestCards({super.key, required this.memberName, required this.memberRelation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: FamilyIcons(
                  relationship: memberRelation,
                  size: 60,
                )
              ),
              // SizedBox(width: 16,),
              Text(memberName,style: TextStyle(
                color: Color(0xff9B4747),
                fontSize: 16,
                fontWeight: FontWeight.w500
              )),
              Spacer(),
              reactionButtons()
            ],
          ),
        ),
      ),
    );
  }



  Widget reactionButtons(){
    return Row(
      children: [
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.close,color: Color(0xff9B4747))),
        IconButton(
            onPressed: (){},
            icon: Icon(Icons.check,color: Color(0xff308983))),

      ],
    );
  }


}
