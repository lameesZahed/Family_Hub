import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:flutter/material.dart';

import '../../Components/Education/grades_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Education/grades_model.dart';

class Grades extends StatelessWidget {
  const Grades({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Grades"),
      endDrawer: MainDrawer(),
      body: gradsBody(),
      floatingActionButton: AddButton(
        onPressed: (){},
      ),
    );
  }


  Widget gradsBody(){
     List grades = GradesModel().gradesList;
    return ListView.builder(
      itemCount: grades.length,
      itemBuilder: (context,index){
        return GradesCards(grades: grades[index]);
      },
    );
  }


}
