import 'dart:async';

import 'package:flutter/material.dart';

class AdsSlider extends StatefulWidget {
   const AdsSlider({super.key});

  @override
  State<AdsSlider> createState() => _AdsSliderState();
}

class _AdsSliderState extends State<AdsSlider> {
  List<String> images = [
    "assets/Images/Home/slider_1.png",
    "assets/Images/Home/slider_2.png",
    "assets/Images/Home/slider_3.png",
    "assets/Images/Home/slider_4.png"
  ];

  int currentIndex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % images.length;
      });
    });

  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  color: Color(0xFF308983),
                  width: 1,
                strokeAlign: BorderSide.strokeAlignOutside
              ),
            ),
          child: ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(16),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 500),
              child: Image.asset(
                images[currentIndex],
                key: ValueKey(currentIndex),
                fit: BoxFit.cover,
              ),
            ),
          )
        ),
        SizedBox(height: 8),
        animatedTrack()
      ],
    );
  }


  Widget animatedTrack(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(images.length, (index){
        return AnimatedContainer(
          duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
              color: currentIndex == index ? Color(0xFF308983) : Color(0xFF308983).withOpacity(0.5),
              borderRadius: BorderRadius.circular(16)
            ),
          height: 8,
          width: currentIndex == index ? 72 : 24,
          margin: EdgeInsets.symmetric(horizontal: 4),
        );
      }),
    );
  }

}
