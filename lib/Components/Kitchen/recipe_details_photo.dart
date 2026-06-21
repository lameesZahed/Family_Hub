import 'package:flutter/material.dart';

class RecipeDetailsPhoto extends StatelessWidget {
  final String? photo;
  const RecipeDetailsPhoto({super.key, required this.photo, });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(photo??"assets/Images/Kitchen/recipe_placeholder.jpeg",
              height: 400,
              fit: BoxFit.cover,
              width: double.infinity,
            )
        ),
        Padding(
            padding: const EdgeInsets.all(16.0),
            child: BackButton(
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.8),
              ),
            )

        ),
        Positioned(
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DrawerButton(
              onPressed: (){
                Scaffold.of(context).openEndDrawer();
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
