import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotitleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NotitleAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios_new),
      ),
      backgroundColor: Color(0xFFFFF4EA),
      // title: const Text(
      //   'Medicine',
      //   style: TextStyle(
      //     color: Color(0xFF9B4747),
      //     fontWeight: FontWeight.bold,
      //     fontSize: 24,
      //   ),
      // ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/Icons/home.svg"),
          ),
        ),
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
