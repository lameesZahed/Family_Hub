import 'package:flutter/material.dart';

import '../../Models/Kitchen/recipes_model.dart';
import '../../Screens/Kitchen/view_recipe.dart';


class RecipesCard extends StatefulWidget {
  final String recipeName;
  final String? image;
  const RecipesCard({super.key, required this.recipeName,required this.image,});

  @override
  State<RecipesCard> createState() => _RecipesCardState();
}

class _RecipesCardState extends State<RecipesCard> {
  late String recipeImage;


  @override
  void initState() {
    recipeImage = widget.image??"assets/Images/Kitchen/recipe_placeholder.jpeg";
    super.initState();
  }


  bool isSaved = false;
  String recipeDescription = "2 cup of flour and some salt, and some water, chop some tomatoes";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewRecipe(
          recipeImage: recipeImage ,
          recipeName: widget.recipeName,
          ingredient: RecipesModel().recipes[widget.recipeName]![1],
          steps: RecipesModel().recipes[widget.recipeName]![1],
        )));
      },
      child: Stack(
        children: [
          Card(
             color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(16)
              ),
              child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16)
                      ),
                      child: Image.asset(recipeImage,
                        height: 100,width: double.infinity,fit: BoxFit.cover,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(widget.recipeName,style: TextStyle(
                              color: Color(0xFF9B4747),
                              fontWeight: FontWeight.normal,
                              fontSize: 16
                          ),),
                          SizedBox(height: 8),
                          Text(recipeDescription,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                              color: Color(0xFF6E5C52),
                              fontWeight: FontWeight.normal,
                              fontSize: 12
                          )),
                        ],
                      ),
                    )
                  ]
              )

          ),
          Positioned(
            top: 8,
              right: 8,
              child: IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Color(0xFF308983),
                ),
                  onPressed: (){
                  setState(() {
                    isSaved = !isSaved;
                  });
                  },
                  icon:(isSaved)?Icon(Icons.bookmark): Icon(Icons.bookmark_border)
              )),

        ],
      ),
    );
  }
}
