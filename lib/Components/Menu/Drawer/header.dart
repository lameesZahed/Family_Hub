import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/Authentication/auth_bloc.dart';
import '../../../Bloc/Authentication/auth_state.dart';


class Header extends StatelessWidget {
  const Header({super.key});


  Widget buildProfileImage(String? avatarPath) {
    if (avatarPath == null || avatarPath.isEmpty) {
      return Image.asset(
        "assets/Images/User_Profile.png",
        width: 60,
        height: 60,
        fit: BoxFit.cover,
      );
    }
    return Image.file(
      File(avatarPath),
      width: 60,
      height: 60,
      fit: BoxFit.cover,
    );
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final user = state is AuthSuccess ? state.user : null;

        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, "Profile");
          },
          child: SafeArea(
            bottom: false,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: buildProfileImage(user?.avatarUrl),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user?.fullName ?? "Username",
                      style: const TextStyle(
                        color: Color(0xFF9B4747),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Text(
                        user?.email ?? "username@gmail.com",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Color(0xFF6E5C52),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}