import 'package:equatable/equatable.dart';

abstract class HospitalEvent extends Equatable {
  const HospitalEvent();

  @override
  List<Object?> get props => [];
}

class LoadNearbyHospitalsEvent extends HospitalEvent {
  final double latitude;
  final double longitude;
  final int limit;
  final int radiusKm;

  const LoadNearbyHospitalsEvent({
    required this.latitude,
    required this.longitude,
    this.limit = 5,
    this.radiusKm = 10,
  });

  @override
  List<Object?> get props => [latitude, longitude, limit, radiusKm];
}