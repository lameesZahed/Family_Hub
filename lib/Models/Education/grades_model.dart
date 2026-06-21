import 'package:family_hub/Models/Education/grades.dart';

class GradesModel {
  List<Grades> gradesList = [
    Grades(
      subjectName: "English",
      maxGrade: 100,
      currentGrade: 80,
    ),
    Grades(
        subjectName: "Mathematics",
        maxGrade: 100,
        currentGrade: 90,

    ),
    Grades(
        subjectName: "Science",
        maxGrade: 100,
        currentGrade: 70
    ),
    Grades(
        subjectName: "History",
        maxGrade: 100,
        currentGrade: 85
    ),
    Grades(
        subjectName: "Geography",
        maxGrade: 100,
        currentGrade: 75
    ),
    Grades(
        subjectName: "Art",
        maxGrade: 100,
        currentGrade: 95
    ),
    Grades(
        subjectName: "Music",
        maxGrade: 100,
        currentGrade: 88
    ),
  ];
}
