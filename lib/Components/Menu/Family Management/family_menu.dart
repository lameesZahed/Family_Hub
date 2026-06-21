import 'package:flutter/material.dart' ;
import 'package:flutter_svg/svg.dart';

import '../../../Models/Family Tree/family.dart';
import '../../../Models/Family Tree/family_model.dart';
import 'family_icons.dart';

class FamilyMenu extends StatelessWidget {
  final TextEditingController controller;
  FamilyMenu({super.key, required this.controller});


  late String memberNameSelected;
  late Family memberRelationSelected;

  @override
  Widget build(BuildContext context) {
    String relationFirst = FamilyModel().familyMembers.first.relationship.name;
    String nameFirst = FamilyModel().familyMembers.first.name;
    controller.text = "$nameFirst (${(relationFirst.length>12)?relationFirst.substring(0,11):relationFirst})";

    return DropdownMenu(
        controller: controller,
        width: double.infinity,
        dropdownMenuEntries: FamilyModel().familyMembers.map((element){
          memberNameSelected = element.name;
          memberRelationSelected = element.relationship;
          return DropdownMenuEntry(
              label: "$memberNameSelected (${(memberRelationSelected.name.length>12)?memberRelationSelected.name.substring(0,11):memberRelationSelected.name})",
              value: memberNameSelected,
              leadingIcon: FamilyIcons(
                relationship: element.relationship,
                size: 32,
              )
          );
        }).toList()
    );
  }
}
