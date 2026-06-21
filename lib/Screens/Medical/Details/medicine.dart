import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/Medication/Medicines/medicine_bloc.dart';
import '../../../Bloc/Medication/Medicines/medicine_event.dart';
import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Customized Buttons/button.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Server/Authentication/api_client.dart';
import 'add_edit_medicine.dart';

class Medicine extends StatelessWidget {
  final int id;
  final String image;
  final String name;
  final String description;
  final int quantity;

  const Medicine({
    super.key,
    required this.id,
    required this.image,
    required this.name,
    required this.description,
    required this.quantity,
  });

  TextStyle get titlesStyle => const TextStyle(
    color: Color(0xFF9B4747),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  Future<void> deleteMedicine(BuildContext context) async {
    final user = await ApiClient.getFreshUser();
    if (user == null) return;
    context.read<MedicineBloc>().add(
      DeleteMedicineEvent(id: id, firebaseUid: user.firebaseUid),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final hasImage = image.isNotEmpty;
    final String fullImageUrl = image.startsWith('http')
        ? image
        : '${ApiClient.baseUrl}$image';
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: MainAppBar(title: name),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 100,
                backgroundImage: hasImage
                    ? NetworkImage(fullImageUrl)
                    : const AssetImage("assets/Images/Placeholder Circle.png") as ImageProvider,
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Text("Amount : ", style: titlesStyle),
                const SizedBox(width: 16),
                Text(
                  quantity.toString(),
                  style: TextStyle(
                    color: const Color(0xFF016B61).withOpacity(0.7),
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text("Description", style: titlesStyle),
            const SizedBox(height: 16),
            Text(
              description,
              style: const TextStyle(color: Color(0xFF016B61), fontSize: 12),
              overflow: TextOverflow.ellipsis,
              maxLines: 6,
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: Button(
                    text: "Edit",
                    onPressed: () async {
                      // 👇 بنستني النتيجة اللي راجعة من صفحة التعديل
                      final isUpdated = await Navigator.push<bool>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddEditMedicine(
                            id: id,
                            image: image,
                            name: name,
                            description: description,
                            quantity: quantity,
                          ),
                        ),
                      );

                      // 👈 لو رجع true، معناه إنه عدل بنجاح! فنقفل صفحة التفاصيل فوراً عشان نرجع للرئيسية المحدثة
                      if (isUpdated == true && context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}