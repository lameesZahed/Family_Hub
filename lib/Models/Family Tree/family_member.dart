import 'package:family_hub/Models/Family%20Tree/family.dart';

class FamilyMember{
  final int id;
  final String name;
  final Family relationship;
  final Roles role;

  const FamilyMember({required this.role, required this.name,required this.relationship,required this.id});
}