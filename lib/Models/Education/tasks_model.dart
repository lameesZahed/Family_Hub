import 'package:family_hub/Models/Education/task.dart';
import 'package:flutter/material.dart';

class TasksModel {
  List<Task> tasks = [
    Task(
      title: "Cloud Computing",
      isDone: false,
      type: taskType.Project,
      description: "Cloud Computing project",
      date: DateTime(2026,3,5),
      time: TimeOfDay(hour: 12, minute: 30),
    ),
    Task(
      title: "Intro to Statistics",
      isDone: true,
      type: taskType.Course,
      description: "Intro to Statistics course",
      date: DateTime(2026,3,5),
      time: TimeOfDay(hour: 12, minute: 30),
    ),
    Task(
      title: "Intro to Programming",
      isDone: true,
      type: taskType.Lesson,
      description: "Intro to Programming lesson",
      date: DateTime(2026,3,5),
      time: TimeOfDay(hour: 12, minute: 30),
    ),
    Task(
      title: "Operating system",
      isDone: false,
      type: taskType.Lesson,
      description: "Operating system lesson",
      date: DateTime(2026,3,5),
      time: TimeOfDay(hour: 12, minute: 30)
    ),
    Task(
      title: "Game design",
      isDone: false,
      type: taskType.Project,
      description: "Game design project",
      date: DateTime(2026,3,5),
      time: TimeOfDay(hour: 12, minute: 30),
    ),
    Task(
      title: "User interface design",
      isDone: true,
      type: taskType.Course,
      description: "User interface design course",
      date: DateTime(2026,3,5),
      time: TimeOfDay(hour: 12, minute: 30),
    ),
    Task(
      title: "Cloud Engineer",
      isDone: true,
      type: taskType.Project,
      description: "Cloud Engineer project",
      date: DateTime(2026,3,5),
      time: TimeOfDay(hour: 12, minute: 30),
    ),
  ];
}
