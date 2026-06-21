import 'package:family_hub/Screens/Kitchen/view_recipe.dart';
import 'package:flutter/material.dart';

class RecipeGeneratedCard extends StatelessWidget {
  final String recipeName;
  const RecipeGeneratedCard({super.key, required this.recipeName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ),
          leading: Icon(Icons.auto_awesome,color: Color(0xff308983),size: 24,),
          title: Text(recipeName),
          titleTextStyle: TextStyle(
            color: Color(0xff9B4747),
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
          trailing: Icon(Icons.arrow_forward_ios_rounded,color: Color(0xff9B4747),size: 16,),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewRecipe(
                recipeName: recipeName,
                ingredient: """1 lb (450g) large shrimp, peeled and deveined 
3 tablespoons unsalted butter
4 cloves garlic, minced
2 tablespoons fresh lemon juice
1 teaspoon olive oil
1/4 cup fresh parsley, finely chopped
Salt and freshly ground black pepper to taste
A pinch of red pepper flakes (optional, for a little heat)""",
                steps: """Prepare the Shrimp: Pat the shrimp dry with paper towels. Season them evenly with a pinch of salt and freshly ground black pepper.
Heat the Skillet: In a large skillet, heat the olive oil and 1 tablespoon of the butter over medium-high heat until the butter is melted and bubbling.
Cook the Shrimp: Add the shrimp to the skillet in a single layer. Cook for about 1 to 2 minutes on one side until they start to turn pink.
Add Garlic and Spices: Flip the shrimp. Immediately add the minced garlic and red pepper flakes (if using). Cook for another 1 minute, stirring frequently so the garlic doesn't burn.
Make the Sauce: Reduce the heat to medium-low. Add the remaining 2 tablespoons of butter and the fresh lemon juice to the skillet. Stir gently until the butter is completely melted and coats the shrimp to create a rich sauce.
Garnish and Serve: Remove the skillet from the heat. Stir in the freshly chopped parsley. Serve immediately over pasta, rice, or with a side of crusty bread to soak up the garlic butter sauce."""
            )));
          }


        )
      ),
    );
  }
}
