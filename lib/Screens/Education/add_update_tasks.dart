import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Components/Education/add_update_cards.dart';
import 'package:flutter/material.dart';

import '../../Components/Education/add_update_calendar.dart';
import '../../Components/Education/add_update_timer.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Components/Customized Buttons/button.dart';
import '../../Models/Education/task.dart';
import '../../Models/Education/task_type_for_overlay.dart';

class AddUpdateTasks extends StatelessWidget {
  final Task? task;
  final String title;
  const AddUpdateTasks({super.key, this.task, required this.title});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          title: (task!=null)? "Update ${task!.type.name}": "Add $title",
      ),
      endDrawer: MainDrawer(),
      body: addUpdateTasksBody(),
    );
  }
  
  
  
  Widget addUpdateTasksBody(){
    return SingleChildScrollView(
      child: Form( 
        child: Column(
          children: [
            AddUpdateCards(
                dataDetails: task?.title??"",
                type: title,
                lines: 1,
                length: 25,
                header: "Name"
            ),
            AddUpdateCards(
                dataDetails: task?.description??"",
                type: title,
                lines: 5,
                length: 100,
                header: "Description"
            ),
            AddUpdateTimer(
              time: task?.time??TimeOfDay.now(),
            ),
            AddUpdateCalendar(
              date: task?.date??DateTime.now(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Button(
                text: "Save",
                onPressed: (){},
              ),
            )
          ],
        ),
      ),
    );
  }
}
