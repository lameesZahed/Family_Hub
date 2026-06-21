import 'package:flutter/material.dart';

class Termsconditions extends StatelessWidget {
  final bool menu;
  const Termsconditions({super.key, required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: (menu)? DrawerButton():SizedBox(),
      appBar: AppBar(
        title: Text("Privacy Policy",
        ),
        centerTitle: true,
      ),
    );
  }
}
