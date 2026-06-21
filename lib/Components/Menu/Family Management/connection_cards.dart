import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../Models/Family Tree/family.dart';
import 'family_icons.dart';

class ConnectionCards extends StatelessWidget {
  final Family firstRelationship;
  final String firstMemberName;
  final Family secondRelationship;
  final String secondMemberName;
  const ConnectionCards({
    super.key,
    required this.firstRelationship,
    required this.firstMemberName,
    required this.secondRelationship,
    required this.secondMemberName,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        motion: DrawerMotion(),
        dragDismissible: true,
        dismissible: DismissiblePane(
          key: UniqueKey(),
            onDismissed: (){}
        ),
        children: [
          SlidableAction(
            onPressed: (context){},
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),

            )
          )
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            smallerCards(firstMemberName, firstRelationship, true),
            smallerCards(secondMemberName, secondRelationship, false),
          ],
        ),
      ),
    );
  }

  Widget smallerCards(String name, Family relationship, bool isFirst) {
    return Row(
      children: [
        (isFirst)
            ? FamilyIcons(relationship: firstRelationship, size: 60)
            : SizedBox(),
        SizedBox(width: 8),
        Column(
          children: [
            Text(
              name,
              style: TextStyle(
                color: Color(0xff9B4747),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Relationship",
              style: TextStyle(
                color: Color(0xff9B4747),
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 4),
            Text(
              (relationship.name.length > 12)
                  ? relationship.name.substring(0, 11)
                  : relationship.name,
              style: TextStyle(
                color: Color(0xff308983),
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
        SizedBox(width: 8),
        (isFirst)
            ? SizedBox()
            : FamilyIcons(relationship: secondRelationship, size: 60),
      ],
    );
  }
}
