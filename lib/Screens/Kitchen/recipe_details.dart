import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Models/Kitchen/calorie_cost_duration.dart';
import 'package:family_hub/Models/Kitchen/recipes_model.dart';
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Kitchen/details_block.dart';
import '../../Components/Kitchen/recipe_details_image.dart';
import '../../Components/Kitchen/time_calorie_slider.dart';
import '../../Components/Lists/image_placeholder.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class RecipeDetails extends StatelessWidget {
  final String? recipeName;
  RecipeDetails({super.key, this.recipeName});

  TextEditingController recipe_name = TextEditingController();
  TextEditingController recipe_description = TextEditingController();
  TextEditingController recipe_cost = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(),
      appBar: MainAppBar(
        title: (recipeName == null) ? "Add Recipe" : "Update Recipe",
      ),
      body: detailsBody(),
    );
  }


  Widget detailsBody() {
    recipe_name.text =recipe_name.text+(recipeName??"");
    recipe_description.text =recipe_description.text+(RecipesModel().recipes[recipeName]?[1]??"");
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              RecipeDetailsImage(
                image: (RecipesModel().recipes[recipeName] == null)
                    ? null
                    : RecipesModel().recipes[recipeName]?.first,
              ),
              SizedBox(height: 32),
              DetailsBlock(
                title: "Name",
                hint: "Enter recipe name",
                maxLines: 1,
                length: 17,
                // description: RecipesModel().recipes[recipeName]![1],
                controller: recipe_name,
              ),
              DetailsBlock(
                title: "Description",
                hint: "Tell a little about your recipe",
                maxLines: 4,
                length: 130,
                // description:RecipesModel().recipes[recipeName]![1],
                controller: recipe_description,
              ),
              DetailsBlock(
                title: "Cost",
                hint: "Enter recipe cost",
                maxLines: 1,
                length: 130,
                // description:RecipesModel().recipes[recipeName]![1],
                controller: recipe_cost,
              ),
              SizedBox(height: 32),
              TimeSlider(value: (RecipesModel().recipes[recipeName] == null)
                  ? 0
                  : RecipesModel().recipes[recipeName]?.last,
                max: 60,
                type: CalorieCostDuration.Duration,
              ),
              SizedBox(height: 24,),
              TimeSlider(value: 250, max: 1000,type: CalorieCostDuration.Calorie,),
              // Spacer(),
              // SizedBox(height: 32,),
              SizedBox(height: 64,),

              Button(text: (recipeName == null) ? "Add" : "Update", onPressed: (){}),
              SizedBox(height: 64,),

            ],
          ),
        ),
      ),
    );
  }


}
