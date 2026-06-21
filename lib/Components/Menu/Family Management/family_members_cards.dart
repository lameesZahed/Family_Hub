import 'package:family_hub/Components/Menu/Family%20Management/admin_owner_member_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Models/Family Tree/family.dart';
import 'family_icons.dart';

class FamilyMembersCards extends StatelessWidget {
  final String name;
  final Family relationship;
  final Roles role;
  const FamilyMembersCards({super.key, required this.name, required this.role, required this.relationship,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              upperCard(),
              SizedBox(height: 8,),
              Text(name,style: TextStyle(
                color: Color(0xff9B4747),
                fontSize: 16,
                fontWeight: FontWeight.w500
              )),
              SizedBox(height: 8,),
              Text("Relationship",style: TextStyle(
                  color: Color(0xff9B4747),
                  fontSize: 10,
                  fontWeight: FontWeight.normal
              )),
              SizedBox(height: 4,),
              Text( (relationship.name.length>12)?relationship.name.substring(0,11):relationship.name,
                  style: TextStyle(
                  color: Color(0xff308983),
                  fontSize: 14,
                  fontWeight: FontWeight.normal
              )),
              SizedBox(height: 8,),
              lowerCard()

            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: AdminOwnerMemberDialog(role: role,),
          )
        ],
      )
    );
  }


  Widget upperCard(){
    return Stack(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.white,
          child: FamilyIcons(
            relationship: relationship,
            size: 60,
          )
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }



  Widget lowerCard(){
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: (role==Roles.Owner)?Color(0xff9B4747):
              (role==Roles.Admin)?Color(0xff6E5C52):
              Color(0xff308983)
          ),
          color: (role==Roles.Owner)?Color(0xff9B4747).withOpacity(0.3):
          (role==Roles.Admin)?Color(0xff6E5C52).withOpacity(0.3):
          Color(0xff308983).withOpacity(0.3)
      ),
      padding: EdgeInsets.all(8),
      child: Text(role.name,style: TextStyle(fontSize: 12)),
    );
  }


}
