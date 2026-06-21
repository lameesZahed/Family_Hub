import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Screens/Kitchen/recipe_details.dart';
import 'package:family_hub/Screens/Kitchen/view_recipe.dart';
import 'package:flutter/material.dart';

import '../../Components/Customized Buttons/custome_floating_button.dart';
import '../../Components/Kitchen/recipe_details_photo.dart';
import '../../Components/Kitchen/recipes_card.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Kitchen/recipes_model.dart';

class Kitchen extends StatelessWidget {
  const Kitchen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Kitchen"),
      endDrawer: MainDrawer(),
      floatingActionButton:aiButton(context) ,
      body: kitchenBody(context),
    );
  }


  Widget kitchenBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Text("My recipes",style: TextStyle(
                  color: Color(0xff9B4747),
                  fontSize: 20,
                  fontWeight: FontWeight.normal
                ),),
                Spacer(),
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xff9B4747),
                    textStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    )
                  ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetails()));
                    },
                    child: Row(
                      children: [
                        Text("Add recipes"),
                        SizedBox(width: 4,),
                        Icon(Icons.add,size: 24,),
                      ],
                    )
                ),
              ],
            ),
            SizedBox(height: 16,),
            recipeList()
          ],
        ),
      ),
    );
  }

  Widget recipeList(){
    Map recipes = RecipesModel().recipes;
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 16,
          childAspectRatio: 0.9
      ),
      itemCount: recipes.length,
      itemBuilder: (context,index){
        return RecipesCard(
          recipeName: recipes.keys.elementAt(index) ,
          image: recipes.values.elementAt(index)[0],
          // onPressed: (){
          //
          //   // Navigator.push(context, MaterialPageRoute(builder: (context)=>RecipeDetails(
          //   //   recipeName: recipes.keys.elementAt(index) ,
          //   // )));
          // },
        );
      },
    );

  }
  
  CustomeFloatingButton aiButton(BuildContext context){
    return CustomeFloatingButton(
      icon: Icons.auto_awesome,
      onPressed: () {
        Navigator.pushNamed(context, "AI Recipe Generator");
      },
    );
  }





}
