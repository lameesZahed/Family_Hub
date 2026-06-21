import 'package:flutter/material.dart';

import '../../Models/Education/task.dart';
import '../../Screens/Education/completed_tasks.dart';

class CompletedTasksCards extends StatelessWidget {
  final List <Task> tasks ;
  CompletedTasksCards({super.key, required this.tasks});


  List <Task> completedTasks(){
    List <Task> completedTasksList = [];
    for(var task in tasks){
      if(task.isDone == true){
        completedTasksList.add(task);
      }
    }
    return completedTasksList;
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>CompletedTasks(tasks: completedTasks())));
        },
        child: DecoratedBox(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text("${tasks[0].type.name}s Completed"),
                        titleTextStyle: TextStyle(
                          color: Color(0xFF655B5B),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        subtitle: Text("${tasks.length} remaining"),
                        subtitleTextStyle: TextStyle(
                          color: Color(0xFFC4B7A6),
                          fontSize: 12,
                        ),
                        trailing: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: Color(0xFF308983),
                              )
                            ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical:8.0),
                            child: Text("${completedTasks().length}/${tasks.length}",style: TextStyle(
                              color: Color(0xFF308983),
                              fontSize: 12,
                            ),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                        child: LinearProgressIndicator(
                          value: completedTasks().length/tasks.length,
                          minHeight: 8,
                          borderRadius: BorderRadius.circular(16),
                          backgroundColor: Color(0xFF655B5B).withOpacity(0.2),
                          color: Color(0xFF655B5B),
                        ),
                      )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
