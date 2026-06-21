abstract class FamilyEvent {}

class CreateFamilyEvent extends FamilyEvent {
  final String familyName;
  final String relationship;
  CreateFamilyEvent(this.familyName, this.relationship);
}

class JoinFamilyEvent extends FamilyEvent {
  final String familyCode;
  final String relationship;
  JoinFamilyEvent(this.familyCode, this.relationship);
}