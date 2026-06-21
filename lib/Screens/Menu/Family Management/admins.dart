import 'package:family_hub/Models/Family%20Tree/family.dart';
import 'package:flutter/material.dart';

import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Components/Menu/Family Management/family_members_cards.dart';
import '../../../Models/Family Tree/family_member.dart';
import '../../../Models/Family Tree/family_model.dart';

class Admins extends StatelessWidget {
  const Admins({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Admins"),
      endDrawer: MainDrawer(),
      body: adminsBody(),
    );
  }



  Widget adminsBody(){
    int length = FamilyModel().familyMembers.where((element)=>element.role == Roles.Admin || element.role == Roles.Owner).length;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 210
          ),
          itemCount: length,
          itemBuilder: (context,index){
            FamilyMember member = FamilyModel().familyMembers.where((element)=>element.role == Roles.Admin ||element.role == Roles.Owner).elementAt(index);
            return FamilyMembersCards(
              name:member.name,
              role: member.role,
              relationship: member.relationship,
            );
          }
      ),
    );
  }


}
