import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Kitchen/recipe_generated_card.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class RecipeGenerated extends StatelessWidget {
  const RecipeGenerated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "AI recipe generator"),
      endDrawer: MainDrawer(),
      body: recipeGeneratedBody(),
    );
  }


  Widget recipeGeneratedBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Generated recipes",style: TextStyle(
            color: Color(0xff9B4747),
            fontSize: 20,
            fontWeight: FontWeight.normal
          ),),
          SizedBox(height: 24,),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context,index){
              return RecipeGeneratedCard(
                recipeName: "recipe $index",
              );
            },
          )
        ],
      ),
    );
  }


}
