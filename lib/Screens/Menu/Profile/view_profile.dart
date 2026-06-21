import 'dart:io';

import 'package:family_hub/Components/Menu/Profile/user_info_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/Authentication/auth_bloc.dart';
import '../../../Bloc/Authentication/auth_state.dart';
import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Components/Customized Buttons/button.dart';

import 'edit_profile.dart';

class ViewProfile extends StatelessWidget {
  const ViewProfile({super.key});


  Widget buildProfileImage(String? avatarUrl) {
    if (avatarUrl == null || avatarUrl.isEmpty) {
      return Image.asset(
        "assets/Images/User_Profile.png",
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      );
    }
    if (avatarUrl.startsWith('http')) {
      return Image.network(
        avatarUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Image.asset(
          "assets/Images/User_Profile.png",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      );
    }
    return Image.file(
      File(avatarUrl),
      width: 100,
      height: 100,
      fit: BoxFit.cover,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Profile"),
      endDrawer: MainDrawer(),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          final user = state is AuthSuccess ? state.user : null;
          return ProfileBody(context, user);
        },
      ),
    );
  }

  Widget ProfileBody(BuildContext context, dynamic user) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: const Color(0xFF979797), width: 2),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: buildProfileImage(user?.avatarUrl)
            ),
          ),
          const SizedBox(height: 16),
          Text(
            user?.fullName ?? "Username",
            style: const TextStyle(
              color: Color(0xFF9B4747),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            user?.email ?? "username@gmail.com",
            style: const TextStyle(color: Color(0xFF6E5C52), fontSize: 12),
          ),
          const SizedBox(height: 16),
          UserInfoCards(
            category: "Phone number",
            data: user?.mobileNumber ?? "-",
          ),
          UserInfoCards(category: "Gender", data: user?.gender ?? "-"),
          UserInfoCards(category: "Family Name", data: user?.familyName ?? "-"),
          UserInfoCards(category: "Family Code", data: user?.familyCode ?? "-"),
          UserInfoCards(category: "System Role", data: user?.systemRole ?? "-"),
          UserInfoCards(
            category: "Relationship",
            data: user?.relationship ?? "-",
          ),

          const SizedBox(height: 48),
          Button(
            text: 'Edit Profile',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditProfile(profileImage: user?.avatarUrl)),
              );
            },
          ),
        ],
      ),
    );
  }
}
