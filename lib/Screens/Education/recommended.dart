import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Education/recommended_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Recommended"),
      endDrawer: MainDrawer(),
      body: recommendedBody(),
    );
  }


  Widget recommendedBody(){
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context,index){
        return RecommendedCards(
          title: "Intro to Statistics",
          subtitle: "Suggested based on recent performance",
        );
      },
    );
  }


}
