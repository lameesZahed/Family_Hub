import 'package:flutter/material.dart';

class AllCategoriesModel{
  Map <String,IconData> basicCategories = {
    "Food": Icons.fastfood,
    "Transport":Icons.emoji_transportation,
    "Sport":Icons.sports_basketball,
    "Pets":Icons.pets,
  };


  Map <String,List> otherCategories = {
    "Bills":[Icons.monetization_on_outlined,/*isActive=not taken*/ true],
    "Groceries":[Icons.shopping_bag_outlined,true],
    "Subscriptions":[Icons.subscriptions,true],
    "Health":[Icons.health_and_safety,/*isActive=taken*/false],
    "Personal care":[Icons.self_improvement,true],
    "Education":[Icons.school,false],
    "Dept":[Icons.work,true],
    "Clothes":[Icons.checkroom,true],
    "Entertainment":[Icons.movie,true],
  };




}