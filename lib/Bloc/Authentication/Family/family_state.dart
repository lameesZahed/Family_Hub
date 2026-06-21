abstract class FamilyState {}

class FamilyInitial extends FamilyState {}
class FamilyLoading extends FamilyState {}
class FamilyError extends FamilyState {
  final String message;
  FamilyError(this.message);
}

class FamilyCreated extends FamilyState {
  final String familyName;
  final String familyCode;
  FamilyCreated({required this.familyName, required this.familyCode});
}

class FamilyJoined extends FamilyState {}