import 'package:family_hub/Models/Education/education.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EducationCategoryModel{
  List <Education> educationCategories=[
    Education(
        type: "Grades",
        icon: "assets/Icons/Education/grades.svg",
        image_url: "assets/Images/Education/Grades.jpg",
      categoryIndex: 0
    ),
    Education(
        type: "Recommended",
        icon: "assets/Icons/Education/Recommended.svg",
        image_url: "assets/Images/Education/Recommended.jpg",
      categoryIndex: 1
    ),
    Education(
        type: "Tasks",
        icon: "assets/Icons/Education/Tasks.svg",
        image_url: "assets/Images/Education/Tasks.jpg",
      categoryIndex: 2
    ),
    Education(
        type: "Progress Tracker",
        icon: "assets/Icons/Education/progress_tracker.svg",
        image_url: "assets/Images/Education/Progress_Tracker.jpg",
      categoryIndex: 3
    )

  ];
}