
import '../../../Models/Medication/hospitals_model.dart';

abstract class HospitalState {}

class HospitalInitial extends HospitalState {}

class HospitalLoading extends HospitalState {}

class HospitalSuccess extends HospitalState {
  final List<HospitalModel> hospitals;
  HospitalSuccess(this.hospitals);
}

class HospitalError extends HospitalState {
  final String message;
  HospitalError(this.message);
}