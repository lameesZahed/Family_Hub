abstract class MedicineEvent {}

class LoadMedicinesEvent extends MedicineEvent {
  final String firebaseUid;
  LoadMedicinesEvent({required this.firebaseUid});
}
class AddMedicineEvent extends MedicineEvent {
  final String firebaseUid;
  final String name;
  final String description;
  final int quantity;
  final DateTime? expiryDate;
  final String notes;
  final String? imagePath;

  AddMedicineEvent({
    required this.firebaseUid,
    required this.name,
    required this.description,
    required this.quantity,
    this.expiryDate,
    this.notes = '',
    this.imagePath,
  });
}

class UpdateMedicineEvent extends MedicineEvent {
  final int id;
  final String firebaseUid;
  final String name;
  final String description;
  final String imageUrl;
  final int quantity;
  final String? imagePath;
  final DateTime? expiryDate; // 👈 ضيفي السطر ده هنا
  final String notes;         // 👈 ضيفي السطر ده كمان تأميناً للـ Bloc

  UpdateMedicineEvent({
    required this.id,
    required this.firebaseUid,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.quantity,
    this.imagePath,
    this.expiryDate,          // 👈 ضيفيه في الـ Constructor
    this.notes = '',          // 👈 وقيمة افتراضية هنا
  });
}
class DeleteMedicineEvent extends MedicineEvent {
  final int id;
  final String firebaseUid;

  DeleteMedicineEvent({required this.id, required this.firebaseUid});
}