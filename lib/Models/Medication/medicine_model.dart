class MedicineModel {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final int quantity;
  final DateTime? expiryDate;
  final String notes;
  final DateTime? createdAtUtc;

  MedicineModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    this.expiryDate,
    required this.notes,
    this.createdAtUtc,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      quantity: json['quantity'] ?? 0,
      expiryDate: json['expiryDate'] != null
          ? DateTime.tryParse(json['expiryDate'])
          : null,
      notes: json['notes'] ?? '',
      createdAtUtc: json['createdAtUtc'] != null
          ? DateTime.tryParse(json['createdAtUtc'])
          : null,
    );
  }
}