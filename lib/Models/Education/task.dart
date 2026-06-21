import 'package:flutter/material.dart';

class Task{
  final String title;
  final bool isDone;
  final taskType type;
  final String description;
  final DateTime date;
  final TimeOfDay time;

  const Task({required this.date,required this.time, required this.description, required this.title,required this.isDone,required this.type});

}

enum taskType{
  Course,
  Lesson,
  Project
}
