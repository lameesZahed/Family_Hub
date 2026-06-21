import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/Medication/Medicines/medicine_bloc.dart';
import '../../Bloc/Medication/Medicines/medicine_event.dart';
import '../../Bloc/Medication/Medicines/medicine_state.dart';
import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/App Cards/big_cards.dart';
import '../../Components/Medication/medicine_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Server/Authentication/api_client.dart';

class Medication extends StatefulWidget {
  const Medication({super.key});

  @override
  State<Medication> createState() => _MedicationState();
}

class _MedicationState extends State<Medication> {
  @override
  Future<void> _loadMedicines() async {
    final user = await ApiClient.getFreshUser();
    if (user == null) return;
    context.read<MedicineBloc>().add(LoadMedicinesEvent(firebaseUid: user.firebaseUid));
  }

  @override
  void initState() {
    super.initState();
    _loadMedicines();
  }

  Future<void> _deleteMedicine(int id) async {
    final user = await ApiClient.getFreshUser();
    if (user == null) return;
    context.read<MedicineBloc>().add(
      DeleteMedicineEvent(id: id, firebaseUid: user.firebaseUid),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Medication"),
      endDrawer: const MainDrawer(),
      body: Body(context),
    );
  }

  Widget Body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            BigCards(
              image_url: 'assets/Images/Medication/Doctors.jpg',
              icon: "assets/Icons/Doctor.svg",
              type: 'Nearby doctors',
              alignment: const Alignment(0.0, -0.32),
              onTap: () {
                Navigator.pushNamed(context, "NearbyDoctors");
              },
            ),
            const SizedBox(height: 16),
            BigCards(
              image_url: 'assets/Images/Medication/Hospital.jpg',
              icon: "assets/Icons/Hospital.svg",
              type: 'Nearby Hospitals',
              alignment: const Alignment(0.0, -0.32),
              onTap: () {
                Navigator.pushNamed(context, "Hospitals");
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Pharmacy",
                    style: TextStyle(
                        color: Color(0xFF9B4747),
                        fontWeight: FontWeight.normal,
                        fontSize: 20)),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Pharmacy");
                  },
                  child: Row(
                    children: [
                      const Text("See All",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color(0xFF9B4747),
                          )),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward_ios, color: Color(0xFF9B4747)),
                    ],
                  ),
                )
              ],
            ),
            medicineList(),
          ],
        ),
      ),
    );
  }

  Widget medicineList() {
    return BlocBuilder<MedicineBloc, MedicineState>(
      builder: (context, state) {
        if (state is MedicineLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is MedicineError) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(state.message, style: const TextStyle(color: Colors.red)),
          );
        }
        if (state is MedicineSuccess) {
          if (state.medicines.isEmpty) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: Text('No medicines yet')),
            );
          }
          final medicines = state.medicines.take(3).toList();
          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              final medicine = medicines[index];
              return MedicineCards(
                id: medicine.id,
                image: medicine.imageUrl,
                name: medicine.name,
                description: medicine.description,
                quantity: medicine.quantity,
                onDelete: () => _deleteMedicine(medicine.id),
              );
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}