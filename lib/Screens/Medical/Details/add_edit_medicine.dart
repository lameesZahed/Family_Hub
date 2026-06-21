import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../Bloc/Medication/Medicines/medicine_bloc.dart';
import '../../../Bloc/Medication/Medicines/medicine_event.dart';
import '../../../Bloc/Medication/Medicines/medicine_state.dart';

import '../../../Components/App Bar/notitle_app_bar.dart';
import '../../../Components/Customized Buttons/button.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Server/Authentication/api_client.dart';

class AddEditMedicine extends StatefulWidget {
  final int? id;
  final String? image;
  final String? name;
  final String? description;
  final int? quantity;

  const AddEditMedicine({
    super.key,
    this.id,
    this.image,
    this.name,
    this.description,
    this.quantity,
  });

  @override
  State<AddEditMedicine> createState() => _AddEditMedicineState();
}

class _AddEditMedicineState extends State<AddEditMedicine> {
  final _formKey = GlobalKey<FormState>();
  late int medicineCount;
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  File? pickedImage;
  bool isSaving = false;

  bool get isEditing => widget.id != null;

  @override
  void initState() {
    super.initState();
    medicineCount = widget.quantity ?? 0;
    nameController.text = widget.name ?? "";
    descriptionController.text = widget.description ?? "";
  }

  void increment() {
    setState(() => medicineCount++);
  }

  void decrement() {
    if (medicineCount > 0) {
      setState(() => medicineCount--);
    }
  }

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() => pickedImage = File(picked.path));
    }
  }

  Future<void> save() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isSaving = true);

    final user = await ApiClient.getFreshUser();
    if (user == null) {
      setState(() => isSaving = false);
      return;
    }

    if (isEditing) {
      String relativeImageUrl = widget.image ?? '';
      if (relativeImageUrl.startsWith(ApiClient.baseUrl)) {
        relativeImageUrl = relativeImageUrl.replaceAll(ApiClient.baseUrl, '');
      }

      context.read<MedicineBloc>().add(
        UpdateMedicineEvent(
          id: widget.id!,
          firebaseUid: user.firebaseUid,
          name: nameController.text.trim(),
          description: descriptionController.text.trim(),
          imageUrl: relativeImageUrl,
          quantity: medicineCount,
        ),
      );
    } else {
      context.read<MedicineBloc>().add(
        AddMedicineEvent(
          firebaseUid: user.firebaseUid,
          name: nameController.text.trim(),
          description: descriptionController.text.trim(),
          quantity: medicineCount,
          imagePath: pickedImage?.path,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MedicineBloc, MedicineState>(
      listener: (context, state) {
        if (!isSaving) return;

        if (state is MedicineSuccess) {
          setState(() => isSaving = false);
          Navigator.pop(context, true);
        }
        if (state is MedicineError) {
          setState(() => isSaving = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        endDrawer: const MainDrawer(),
        body: Body(),
      ),
    );
  }

  Widget Body() {
    ImageProvider? avatarImage;
    if (pickedImage != null) {
      avatarImage = FileImage(pickedImage!);
    } else if ((widget.image ?? '').isNotEmpty) {
      final String fullImageUrl = widget.image!.startsWith('http')
          ? widget.image!
          : '${ApiClient.baseUrl}${widget.image}';
      avatarImage = NetworkImage(fullImageUrl);
    } else {
      avatarImage = const AssetImage("assets/Images/Placeholder Circle.png");
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: isEditing
                // 👈 وقت التعديل: صورة ثابتة، مفيش تفاعل خالص
                    ? CircleAvatar(radius: 100, backgroundImage: avatarImage)
                // 👈 وقت الإضافة بس: قابلة للضغط لاختيار صورة
                    : GestureDetector(
                  onTap: pickImage,
                  child: Stack(
                    children: [
                      CircleAvatar(radius: 100, backgroundImage: avatarImage),
                      Positioned(
                        right: 4,
                        bottom: 4,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF308983),
                          child: const Icon(Icons.camera_alt, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: decrement,
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                    icon: const Icon(Icons.remove, color: Color(0xFF308983)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Text("$medicineCount"),
                  ),
                  IconButton(
                    onPressed: increment,
                    style: IconButton.styleFrom(backgroundColor: const Color(0xFF308983)),
                    icon: const Icon(Icons.add, color: Colors.white),
                  ),
                ],
              ),
              const Text("Name",
                  style: TextStyle(
                      color: Color(0xFF9B4747), fontSize: 16, fontWeight: FontWeight.w500)),
              const SizedBox(height: 8),
              inputField(
                controller: nameController,
                length: 15,
                maxLines: 1,
                hint: "Enter Medicine Name",
              ),
              const SizedBox(height: 8),
              const Text("Description",
                  style: TextStyle(
                      color: Color(0xFF9B4747), fontSize: 16, fontWeight: FontWeight.w500)),
              inputField(
                maxLines: 4,
                length: 300,
                controller: descriptionController,
                hint: "Enter Medicine Description",
              ),
              const SizedBox(height: 32),
              Center(
                child: isSaving
                    ? const CircularProgressIndicator()
                    : Button(
                  text: isEditing ? "Update" : "Add",
                  onPressed: save,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField({
    required int maxLines,
    required int length,
    required TextEditingController controller,
    required String hint,
  }) {
    return TextFormField(
      maxLines: maxLines,
      maxLength: length,
      controller: controller,
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      decoration: InputDecoration(hintText: hint),
    );
  }
}