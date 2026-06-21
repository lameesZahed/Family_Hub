import 'package:family_hub/Models/Family%20Tree/family.dart';
import 'package:family_hub/Models/Family%20Tree/family_member.dart';

class FamilyModel{
  List <FamilyMember> familyMembers = [
    FamilyMember(name: "Hemat", relationship: Family.Mother,id: 1,role: Roles.Owner),
    FamilyMember(name: "Zahed", relationship: Family.Father,id: 2,role: Roles.Admin),
    FamilyMember(name: "Ahmed", relationship: Family.Son,id: 3,role: Roles.Member),
    FamilyMember(name: "Jomana", relationship: Family.Daughter,id: 4,role: Roles.Member),
    FamilyMember(name: "Lamees", relationship: Family.Daughter,id: 5,role: Roles.Admin),
    FamilyMember(name: "Saneya", relationship: Family.Grandmother_dadSide,id: 6,role: Roles.Member),
    FamilyMember(name: "Elsayed", relationship: Family.Grandfather_dadSide,id: 7,role: Roles.Member),
    FamilyMember(name: "Lola", relationship: Family.Grandmother_momSide,id: 6,role: Roles.Member),
    FamilyMember(name: "Mostafa", relationship: Family.Grandfather_momSide,id: 7,role: Roles.Member),
  ];
}