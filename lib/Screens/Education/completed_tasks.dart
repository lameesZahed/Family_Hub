
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Education/tasks_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Education/task.dart';

class CompletedTasks extends StatelessWidget {
  final List <Task> tasks ;
  const CompletedTasks({super.key, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Completed ${tasks[0].type.name}s"),
      endDrawer: MainDrawer(),
      body: completedTasksBody(),
    );
  }


  Widget completedTasksBody(){
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context,index){
        return TasksCards(task: tasks[index]);
      },
    );
  }
}
