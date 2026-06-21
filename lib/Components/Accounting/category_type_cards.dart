import 'package:flutter/material.dart';


class CategoryTypeCards extends StatelessWidget {
  final IconData categoryIcon;
  final String categoryType;
  final bool categoryActive;
  const CategoryTypeCards({super.key, required this.categoryIcon, required this.categoryType, required this.categoryActive});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (categoryActive)?(){
        // AllCategoriesModel().otherCategories[categoryType]!.first=!AllCategoriesModel().otherCategories[categoryType]!.first;
      }:null,
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        side: BorderSide(
          color: (categoryActive)? Color(0xFF507F7F):Colors.grey
        )
      ),
      child: Row(
        children: [
        Icon(categoryIcon,size: 16,color:(categoryActive)? Color(0xFF507F7F):Colors.grey ,),
        SizedBox(width: 8,),
        Text(categoryType,style: TextStyle(
          color:(categoryActive)? Color(0xFF507F7F):Colors.grey,
          fontSize: 11,
          // fontWeight: FontWeight.bold
        )),
      ]
      ),
    );
  }
}
