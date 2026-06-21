import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const MainAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

//            icon: SvgPicture.asset("assets/Icons/home.svg"),