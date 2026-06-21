import 'dart:io';

import 'package:family_hub/Bloc/Authentication/auth_event.dart';
import 'package:family_hub/Components/Menu/Profile/gender_box.dart';
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Screens/Menu/Profile/view_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../Bloc/Authentication/auth_bloc.dart';
import '../../../Bloc/Authentication/auth_state.dart';
import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Components/Menu/Profile/edit_text_field.dart';


class EditProfile extends StatefulWidget {
  String? profileImage;
  EditProfile({super.key, this.profileImage});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late String genderValue;

  File? imageFile;
  final ImagePicker picker = ImagePicker();

  Future<void> pickImage() async {
    try {
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
          widget.profileImage = pickedFile.path;
        });
      }
    } catch (e) {
      debugPrint("Error picking image: $e");
    }
  }

  Widget buildProfileImage(String? avatarPath) {
    if (avatarPath == null || avatarPath.isEmpty) {
      return Image.asset(
        "assets/Images/User_Profile.png",
        width: 140,
        height: 140,
        fit: BoxFit.cover,
      );
    }
    return Image.file(
      File(avatarPath),
      width: 140,
      height: 140,
      fit: BoxFit.cover,
    );
  }


  @override
  void initState() {
    super.initState();
    final state = context.read<AuthBloc>().state;
    final user = state is AuthSuccess ? state.user : null;
    nameController = TextEditingController(text: user?.fullName ?? '');
    emailController = TextEditingController(text: user?.email ?? '');
    phoneController = TextEditingController(text: user?.mobileNumber ?? '');
    genderValue =  user?.gender ?? '';
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(),
      appBar: MainAppBar(title: "Edit Profile"),
      body: editProfileBody(),
    );
  }

  Widget editProfileBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: buildProfileImage(widget.profileImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      onPressed: pickImage ,
                      icon: const Icon(Icons.edit, color: Colors.white),
                      style: IconButton.styleFrom(backgroundColor: const Color(0xFFC96868)),
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: (){
                    setState(() {
                      widget.profileImage = null;
                    });
                  },
                  child: Text("Remove image")),
              const SizedBox(height: 32),
              EditTextField(label: "Username", hint: "Enter Username", controller: nameController),
              EditTextField(label: "Email", hint: "Enter Email", controller: emailController),
              EditTextField(label: "Phone number", hint: "Enter Phone number", controller: phoneController),
              GenderBox(
                  selectedValue: genderValue,
                  onChange: (value){
                    setState(() {
                      genderValue = value;
                    });
                  },
              ),
              const SizedBox(height: 48),
              Button(
                text: "Update Profile",
                onPressed: () {
                  final state = context.read<AuthBloc>().state;
                  final user = state is AuthSuccess ? state.user : null;
                  if (user == null) return;

                  context.read<AuthBloc>().add(
                    UpdateProfileEvent(
                      firebaseUid: user.firebaseUid,
                      fullName: nameController.text,
                      mobileNumber: phoneController.text,
                      email: emailController.text,
                      gender: genderValue,
                      avatarUrl: widget.profileImage,
                    ),
                  );
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => ViewProfile()),
                        (route) => false,
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}