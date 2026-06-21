class DoctorModel {
  final String id;
  final String name;
  final String category;
  final double latitude;
  final double longitude;
  final double distanceMeters;
  final String distanceLabel;
  final String locationDescription;
  final String address;
  final double rating;

  DoctorModel({
    required this.id,
    required this.name,
    required this.category,
    required this.latitude,
    required this.longitude,
    required this.distanceMeters,
    required this.distanceLabel,
    required this.locationDescription,
    required this.address,
    required this.rating,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      category: json['category'] ?? '',
      latitude: (json['latitude'] ?? 0).toDouble(),
      longitude: (json['longitude'] ?? 0).toDouble(),
      distanceMeters: (json['distanceMeters'] ?? 0).toDouble(),
      distanceLabel: json['distanceLabel'] ?? '',
      locationDescription: json['locationDescription'] ?? '',
      address: json['address'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}