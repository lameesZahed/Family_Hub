import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Screens/Education/add_update_tasks.dart';
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Education/task_type_overlay.dart';
import '../../Components/Education/tasks_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Education/tasks_model.dart';

class Tasks extends StatelessWidget {
  const Tasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Upcoming Tasks"),
      endDrawer: MainDrawer(),
      floatingActionButton: AddButton(
        onPressed: (){
          showModalBottomSheet(
            context: context,
            builder: (context){
              return TaskTypeOverlay();
            },
          );
        },
      ),
      body: tasksBody(),
    );
  }


  Widget tasksBody(){
    List tasks = TasksModel().tasks;
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context,index){
          return TasksCards(task: tasks[index]);
        }
    );
  }


}
