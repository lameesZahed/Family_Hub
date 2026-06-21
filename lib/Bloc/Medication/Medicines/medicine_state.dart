import '../../../Models/Medication/medicine_model.dart';

abstract class MedicineState {}

class MedicineInitial extends MedicineState {}

class MedicineLoading extends MedicineState {}

class MedicineSuccess extends MedicineState {
  final List<MedicineModel> medicines;
  MedicineSuccess(this.medicines);
}

class MedicineError extends MedicineState {
  final String message;
  MedicineError(this.message);
}