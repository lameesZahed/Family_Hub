import 'package:flutter/material.dart';

class Event{
  final String name;
  final String description;
  final TimeOfDay time;
  final int alert;

  Event({required this.name, required this.description, required this.time, required this.alert});
}