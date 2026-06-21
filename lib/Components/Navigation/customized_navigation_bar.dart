import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Screens/Education/education.dart';
import 'package:flutter/material.dart';

import '../../Screens/Calendar/calendar.dart';
import '../../Screens/Home/home.dart';
import '../../Screens/Location/Location.dart';
import '../../Screens/Messaging/messaging.dart';
import '../Menu/Drawer/main_drawer.dart';

class CustomizedNavigationBar extends StatefulWidget {
   const CustomizedNavigationBar({super.key});

  @override
  State<CustomizedNavigationBar> createState() => _CustomizedNavigationBarState();
}

class _CustomizedNavigationBarState extends State<CustomizedNavigationBar> {

  final Map<Widget,String> bodyScreens = {
    const Home(): "Family Name", // index 0
    Calendar():"Calendar", // index 1
    const Messaging():"Messaging", // index 2
    const FamilyLocationScreen():"Location", // index 3
  };
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4EA),
      appBar: MainAppBar(title: bodyScreens.values.elementAt(selectedIndex)),
      endDrawer: MainDrawer(),
      body: SafeArea(child: bodyScreens.keys.elementAt(selectedIndex)),
      bottomNavigationBar: Container(
        height: 56,
        margin: EdgeInsets.only(bottom: 24,left: 16,right: 16,top: 0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.24),
                spreadRadius: 0,
                blurRadius: 4,
                offset: Offset(0, 0),
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              navigationIconButton(Icons.home, 0),
              navigationIconButton(Icons.calendar_month,1),
              navigationIconButton(Icons.chat_outlined, 2),
              navigationIconButton(Icons.location_on_rounded, 3),
            ],
          ),
        ),
      ),
    );
  }


  Widget navigationIconButton(IconData icon,int page_index){
    bool isSelected = selectedIndex == page_index;

    return IconButton(
        onPressed: (){
          setState(() {
            selectedIndex = page_index;
          });
          // switch(page_index){
          //   case 0:
          //     Navigator.pushNamed(context, "Home");
          //     break;
          //   case 1:
          //     Navigator.pushNamed(context, "Calendar");
          //     break;
          //   case 2:
          //     Navigator.pushNamed(context, "Messaging");
          //     break;
          //   case 3:
          //     Navigator.pushNamed(context, "Location");
          //     break;
          // }
        },
        icon: Icon(
          icon,
          color: (isSelected)?Color(0xFFC96868):Color(0xff016B61),
          size: 32,
        ),
    );
  }
}
