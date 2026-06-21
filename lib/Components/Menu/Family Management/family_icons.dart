import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Models/Family Tree/family.dart';
class FamilyIcons extends StatelessWidget {
  final Family relationship;
  final int size;
  const FamilyIcons({super.key, required this.relationship, required this.size});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      (relationship==Family.Father)?"assets/Icons/Family_tree/dad.svg":
      (relationship==Family.Mother)?"assets/Icons/Family_tree/mom.svg":
      (relationship==Family.Daughter)?"assets/Icons/Family_tree/girl.svg":
      (relationship==Family.Son)?"assets/Icons/Family_tree/boy.svg":
      (relationship==Family.Grandmother_momSide || relationship==Family.Grandmother_dadSide)?"assets/Icons/Family_tree/grandmother.svg":
      "assets/Icons/Family_tree/grandfather.svg",
      height: size.toDouble(),
      width: size.toDouble(),

    );
  }
}
