import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Services/Medication/hospital_services.dart';
import 'hospital_event.dart';
import 'hospital_state.dart';

class HospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  final HospitalService _hospitalService = HospitalService();

  HospitalBloc() : super(HospitalInitial()) {
    on<LoadNearbyHospitalsEvent>((event, emit) async {
      emit(HospitalLoading());
      try {
        final hospitals = await _hospitalService.getNearbyHospitals(
          latitude: event.latitude,
          longitude: event.longitude,
          limit: event.limit,
          radiusKm: event.radiusKm,
        );
        emit(HospitalSuccess(hospitals));
      } catch (e, stack) {
        print('HospitalBloc Error: $e');
        print(stack);
        emit(HospitalError('Failed to load hospitals'));
      }
    });
  }
}