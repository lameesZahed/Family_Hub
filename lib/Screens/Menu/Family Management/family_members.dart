import 'package:family_hub/Components/Location/family_cards.dart';
import 'package:family_hub/Models/Family%20Members/family_members_model.dart';
import 'package:flutter/material.dart';

import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Components/Menu/Family Management/family_members_cards.dart';
import '../../../Models/Family Tree/family_member.dart';
import '../../../Models/Family Tree/family_model.dart';

class FamilyMembers extends StatelessWidget {
  const FamilyMembers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Family Members"),
      endDrawer: MainDrawer(),
      body: familyMembersBody(),
    );
  }



  Widget familyMembersBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          mainAxisExtent: 210
        ),
        itemCount: FamilyModel().familyMembers.length,
          itemBuilder: (context,index){
            FamilyMember member = FamilyModel().familyMembers[index];
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
