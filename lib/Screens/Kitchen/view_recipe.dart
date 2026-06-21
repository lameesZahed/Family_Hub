import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Components/Menu/Drawer/main_drawer.dart';
import 'package:family_hub/Models/Kitchen/recipes_model.dart';
import 'package:family_hub/Screens/Kitchen/recipe_details.dart';
import 'package:flutter/material.dart';

import '../../Components/Kitchen/calorie_cost_duration_cards.dart';
import '../../Components/Kitchen/recipe_details_photo.dart';
import '../../Models/Kitchen/calorie_cost_duration.dart';

class ViewRecipe extends StatefulWidget {
  final String? recipeImage;
  final String recipeName;
  final String ingredient;
  final String steps;
  ViewRecipe({super.key, this.recipeImage, required this.recipeName, required this.ingredient, required this.steps});

  @override
  State<ViewRecipe> createState() => _ViewRecipeState();
}

class _ViewRecipeState extends State<ViewRecipe> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.recipeImage == null)?MainAppBar(title: "AI recipe generator"):null,
      endDrawer: MainDrawer(),
        body: viewRecipeBody(context)
    );
  }

  Widget viewRecipeBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          ?(widget.recipeImage == null)?null:RecipeDetailsPhoto(photo:widget.recipeImage ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                upperBody(context),
                SizedBox(height: 16,),
                middleBody(),
                SizedBox(height: 16,),
                lowerBody("Ingredients",widget.ingredient),
                SizedBox(height: 24,),
                lowerBody("Recipe Steps",widget.steps)
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget upperBody(BuildContext context){
    return Row(
      children: [
        Text(widget.recipeName,style: TextStyle(
            color: Color(0xFF9B4747),
            fontWeight: FontWeight.w600,
            fontSize: 20
        ),),
        Spacer(),
        (widget.recipeImage ==null)
            ?IconButton(onPressed: (){
              setState(() {
                isSaved = !isSaved;
              });
        }, icon: Icon((isSaved)?Icons.bookmark_rounded:Icons.bookmark_border_rounded,color: Color(0xFF308983),))
            :IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetails(
                recipeName: widget.recipeName,
              )));
            },
            style: IconButton.styleFrom(
              foregroundColor: Color(0xFF308983),
            ),
            icon: Icon(Icons.mode_edit_outline_outlined,size: 24,)
        )
      ],
    );
  }

  Widget middleBody(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          CalorieCostDurationCards(value: "200", type: CalorieCostDuration.values[0]),
          SizedBox(width: 16,),
          CalorieCostDurationCards(value: "200", type: CalorieCostDuration.values[1]),
          SizedBox(width: 16,),
          CalorieCostDurationCards(value: "200", type: CalorieCostDuration.values[2]),
        ],
      ),
    );
  }

  Widget lowerBody(String title, String data){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 20,
          color: Color(0xFF9B4747)
        )),
        SizedBox(height: 8,),
        Text(data,style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: Color(0xff016B61)
        ),)
      ],
    );
  }
}


