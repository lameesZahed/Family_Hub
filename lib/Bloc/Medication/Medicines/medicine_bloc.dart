import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Services/Medication/medicine_services.dart';
import 'medicine_event.dart';
import 'medicine_state.dart';

class MedicineBloc extends Bloc<MedicineEvent, MedicineState> {
  final MedicineService _service = MedicineService();

  MedicineBloc() : super(MedicineInitial()) {
    on<LoadMedicinesEvent>((event, emit) async {
      emit(MedicineLoading());
      try {
        final medicines = await _service.getMedicines(firebaseUid: event.firebaseUid);
        emit(MedicineSuccess(medicines));
      } catch (e, stack) {
        print('MedicineBloc Load Error: $e');
        print(stack);
        emit(MedicineError('Failed to load medicines'));
      }
    });

    on<AddMedicineEvent>((event, emit) async {
      try {
        await _service.addMedicine(
          firebaseUid: event.firebaseUid,
          name: event.name,
          description: event.description,
          quantity: event.quantity,
          expiryDate: event.expiryDate,
          notes: event.notes,
          imagePath: event.imagePath,
        );
        add(LoadMedicinesEvent(firebaseUid: event.firebaseUid));
      } catch (e, stack) {
        print('MedicineBloc Add Error: $e');
        print(stack);
        emit(MedicineError('Failed to add medicine'));
      }
    });

    on<UpdateMedicineEvent>((event, emit) async {
      try {
        await _service.updateMedicine(
          id: event.id,
          firebaseUid: event.firebaseUid,
          name: event.name,
          description: event.description,
          imageUrl: event.imageUrl,
          quantity: event.quantity,
          imagePath: event.imagePath,
          expiryDate: event.expiryDate,
          notes: event.notes,
        );
        add(LoadMedicinesEvent(firebaseUid: event.firebaseUid));
      } catch (e, stack) {
        print('MedicineBloc Update Error: $e');
        print(stack);
        emit(MedicineError('Failed to update medicine'));
      }
    });

    on<DeleteMedicineEvent>((event, emit) async {
      try {
        await _service.deleteMedicine(id: event.id, firebaseUid: event.firebaseUid);
        add(LoadMedicinesEvent(firebaseUid: event.firebaseUid));
      } catch (e, stack) {
        print('MedicineBloc Delete Error: $e');
        print(stack);
        emit(MedicineError('Failed to delete medicine'));
      }
    });
  }
}