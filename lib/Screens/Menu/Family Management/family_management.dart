import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Components/Menu/Drawer/main_drawer.dart';
import 'package:family_hub/Components/Menu/Family%20Management/family_management_cards.dart';
import 'package:flutter/material.dart';

import '../../../Components/Customized Buttons/two_elements_button.dart';

class FamilyManagement extends StatelessWidget {
  FamilyManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Family Management"),
      endDrawer: MainDrawer(),
      body: familyManagementBody(),
    );
  }


  Map<String,IconData> familyManagementData={
    "Information":Icons.info_outline_rounded,
    "Family Members":Icons.people_alt_outlined,
    "Admins":Icons.admin_panel_settings_outlined,
    "Join Requests":Icons.person_add_alt_1_outlined,
    "Permissions":Icons.key,
    "Manage Children":Icons.child_care_outlined,
  };


  Widget familyManagementBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: familyManagementData.length,
              itemBuilder: (context,index){
                return FamilyManagementCards(
                    title: familyManagementData.keys.elementAt(index),
                    icon: familyManagementData.values.elementAt(index)
                );
              }
          ),
          SizedBox(height: 40,),
          TwoElementsButton(
            onPressed: (){},
            first: Text("Invite Member"),
            second: Icon(Icons.add)
          )
        ],
      ),
    );
  }



}
