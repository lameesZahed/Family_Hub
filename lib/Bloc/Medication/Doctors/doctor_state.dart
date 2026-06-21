import '../../../Models/Medication/doctors_model.dart';

abstract class DoctorState {}
class DoctorInitial extends DoctorState {}
class DoctorLoading extends DoctorState {}
class DoctorSuccess extends DoctorState {
  final List<DoctorModel> doctors;
  DoctorSuccess(this.doctors);
}
class DoctorError extends DoctorState {
  final String message;
  DoctorError(this.message);
}