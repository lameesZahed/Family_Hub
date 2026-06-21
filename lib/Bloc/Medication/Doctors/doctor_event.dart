abstract class DoctorEvent {}

class LoadNearbyDoctorsEvent extends DoctorEvent {
  final double latitude;
  final double longitude;
  LoadNearbyDoctorsEvent({required this.latitude, required this.longitude});
}