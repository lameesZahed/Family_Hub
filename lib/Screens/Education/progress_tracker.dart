import 'package:family_hub/Components/Education/grades_performance_chart.dart';
import 'package:family_hub/Models/Education/task.dart';
import 'package:family_hub/Components/Education/weekly_performance_chart.dart';
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Education/completed_tasks_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Education/tasks_model.dart' show TasksModel;

class ProgressTracker extends StatelessWidget {
  const ProgressTracker({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Progress Tracker"),
      endDrawer: MainDrawer(),
      body: progressTrackerBody(),
    );
  }


  List <Task> typeList(taskType taskType){
    List <Task> typeList = [];
    for(var task in TasksModel().tasks){
      if(task.type == taskType){
        typeList.add(task);
      }
    }
    return typeList;
  }

  Widget progressTrackerBody(){
    return SingleChildScrollView(
      child: Column(
        children: [
          CompletedTasksCards(tasks: typeList(taskType.Course)),
          CompletedTasksCards(tasks: typeList(taskType.Lesson)),
          CompletedTasksCards(tasks: typeList(taskType.Project)),
          WeeklyPerformanceChart(),
          GradesPerformanceChart()
        ],
      ),
    );
  }

}
