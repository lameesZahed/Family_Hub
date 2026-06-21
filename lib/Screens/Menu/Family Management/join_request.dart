import 'package:family_hub/Models/Family%20Tree/family_model.dart';
import 'package:flutter/material.dart';

import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Components/Menu/Family Management/request_cards.dart';
import '../../../Models/Family Tree/family.dart';
import '../../../Models/Family Tree/family_member.dart';
import 'family_members.dart';

class JoinRequest extends StatelessWidget {
  const JoinRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Join Requests"),
      endDrawer: MainDrawer(),
      body: joinRequestBody(),
    );
  }



  Widget joinRequestBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: 2,
          itemBuilder: (context,index){
          FamilyMember member = FamilyModel().familyMembers[index];
            return RequestCards(
              memberName: member.name,
              memberRelation: member.relationship,
            );
          }
      ),
    );
  }


}
