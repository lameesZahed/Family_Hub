import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Screens/Authentication/Register/register.dart';
import 'package:flutter/material.dart';

import '../../../Components/Customized Buttons/secondary_button.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF4EA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/Images/Start.png",
                fit: BoxFit.fill,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 136,
                ),
                child: Text(
                  "Welcome!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 56,),
          Text(
            "Family Hub",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xFFC96868),
            ),
          ),
          Text("keeps your loved ones",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: Color(0xFF1A202C)
          ),),
          Text("closer than ever",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: Color(0xFF1A202C)
          ),),
          SizedBox(height: 56,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                Button(text: "Log in", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register(index: 0)));
                }),
                SizedBox(height: 8),
                SecondaryButton(text: "Sign up", onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register(index: 1)));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
