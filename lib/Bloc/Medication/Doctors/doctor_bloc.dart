import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Services/Medication/doctor_services.dart';
import 'doctor_event.dart';
import 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final DoctorService _doctorService = DoctorService();

  DoctorBloc() : super(DoctorInitial()) {
    on<LoadNearbyDoctorsEvent>((event, emit) async {
      emit(DoctorLoading());
      try {
        final doctors = await _doctorService.getNearbyDoctors(
          latitude: event.latitude,
          longitude: event.longitude,
        );
        emit(DoctorSuccess(doctors));
      }  catch (e, stack) {
      print('DoctorBloc Error: $e');
      print(stack);
      emit(DoctorError('Failed to load doctors'));
    }
    });
  }
}