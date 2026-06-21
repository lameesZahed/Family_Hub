import 'package:flutter/material.dart';

import '../../Models/Education/grades.dart';

class GradesCards extends StatelessWidget {
  final Grades grades;
  const GradesCards({super.key, required this.grades});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(grades.subjectName,style: TextStyle(
              color: Color(0xff6E5C52),
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),),
            trailing: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: Color(0xff6E5C52).withOpacity(0.5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("${grades.currentGrade}/${grades.maxGrade}",style: TextStyle(
                  color: Color(0xff308983),
                  fontSize: 12,
                )),
              ),
            ),
              onTap: (){},
          ),
        ),
      ),
    );
  }
}
