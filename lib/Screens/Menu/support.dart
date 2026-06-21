import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Components/Menu/Support/support_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Components/Menu/Drawer/main_drawer.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: 'Support'),
      body: SupportBody(),
      drawer: MainDrawer(),
    );
  }



  Widget SupportBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text("Any question or remarks? Just write us a message!",style: TextStyle(
              color: Color(0xFF6E5C52),
              fontSize: 16,
            ),
              textAlign: TextAlign.center,
          ),
          ),
          SizedBox(height: 48,),
          SupportCards(info: "+20 111 551 2926", icon: Icons.phone_in_talk),
          SizedBox(height: 16,),
          SupportCards(info:"familyhub.graduation@gmail.com", icon: Icons.email),




        ],
      ),
    );
  }




}
