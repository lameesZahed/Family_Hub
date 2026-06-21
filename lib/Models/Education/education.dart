import 'package:flutter/material.dart';
class Education{
  final String type;
  final String icon;
  final String image_url;
  final int categoryIndex; //0=Grades, 1=Recommended, 2=Tasks, 3=Progress Tracker

  const Education({required this.type,required this.icon,required this.image_url,required this.categoryIndex});
}