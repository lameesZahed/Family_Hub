import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/Medication/Medicines/medicine_bloc.dart';
import '../../Bloc/Medication/Medicines/medicine_event.dart';
import '../../Bloc/Medication/Medicines/medicine_state.dart';
import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Customized Buttons/add_button.dart';
import '../../Components/Medication/medicine_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Server/Authentication/api_client.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({super.key});

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
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

  Future<void> deleteMedicine(int id) async {
    final user = await ApiClient.getFreshUser();
    if (user == null) return;
    context.read<MedicineBloc>().add(
        DeleteMedicineEvent(id: id, firebaseUid: user.firebaseUid));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: MainAppBar(title: 'Pharmacy'),
      floatingActionButton: AddButton(
        onPressed: () {
          Navigator.pushNamed(context, "AddEditMedicine");
        },
      ),
      body: BlocBuilder<MedicineBloc, MedicineState>(
        builder: (context, state) {
          if (state is MedicineLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is MedicineError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: const TextStyle(color: Colors.red)),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _loadMedicines,
                    child: const Text('Try Again'),
                  ),
                ],
              ),
            );
          }
          if (state is MedicineSuccess) {
            if (state.medicines.isEmpty) {
              return const Center(child: Text('No medicines yet'));
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView.builder(
                itemCount: state.medicines.length,
                itemBuilder: (context, index) {
                  final medicine = state.medicines[index];
                  return MedicineCards(
                    id: medicine.id,
                    image: medicine.imageUrl,
                    name: medicine.name,
                    description: medicine.description,
                    quantity: medicine.quantity,
                    onDelete: () => deleteMedicine(medicine.id),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
// Widget HealthArticles() {
//   return Scrollbar(
//     thumbVisibility: true,
//     radius: Radius.circular(100),
//     interactive: true,
//     thickness: 6,
//     child: ListView.builder(
//         itemCount: ArticlesModel.articles.length,
//         itemBuilder:(context, index) {
//           List article = ArticlesModel.articles.values.elementAt(index);
//           return ArticleCards(
//             image: article[0],
//             description: article[1],
//             date: article[2],
//             saved: article[3],
//           );
//         }
//     ),
//   );
// }
