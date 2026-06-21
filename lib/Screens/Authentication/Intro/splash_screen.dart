import 'dart:async';

import 'package:family_hub/Screens/Authentication/Intro/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Components/Navigation/customized_navigation_bar.dart';
import '../../../Server/Authentication/api_client.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showLogo = false;


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() => showLogo = true);
    });
    Timer(const Duration(seconds: 3), () async {
      if (!mounted) return;
      bool isLoggedIn = await ApiClient.init();
      Widget nextScreen = isLoggedIn
          ? const CustomizedNavigationBar()
          : const Start();
      if (!mounted) return;


      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 800),
          pageBuilder: (context, animation, secondaryAnimation) => nextScreen,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fade = Tween<double>(begin: 0, end: 1).animate(animation);
            final slide = Tween<Offset>(
              begin: const Offset(0, 0.08),
              end: Offset.zero,
            ).animate(animation);

            return FadeTransition(
              opacity: fade,
              child: SlideTransition(
                position: slide,
                child: child,
              ),
            );
          },
        ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedOpacity(
        opacity: showLogo ? 1 : 0,
        duration: const Duration(milliseconds: 300),
        child: Padding(
          padding: const EdgeInsets.only(left: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/Images/Logo.svg"),
              Text("Family Hub")
            ],
          ),
        ),
      )
    );
  }
}
