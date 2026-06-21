import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Screens/Education/add_update_tasks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Customized Buttons/secondary_button.dart';
import '../../Components/Education/view_task_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Education/task.dart';

class ViewTask extends StatelessWidget {
  final Task task;
  const ViewTask({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "My ${task.type.name}"),
      endDrawer: MainDrawer(),
      body: viewTaskBody(context),
    );
  }



  Widget viewTaskBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(task.title,style: TextStyle(
              color: Color(0xff9B4747),
              fontSize: 24,
            )),
          ),
          ViewTaskCards(title: "Description", description: task.description, isTime: null,),
          Row(
            children: [
              Expanded(child: ViewTaskCards(title: "Date", description: DateFormat('yyyy-MM-dd').format(task.date), isTime: false,)),
              Expanded(child: ViewTaskCards(title: "Time", description: TimeOfDay(hour: task.time.hour, minute: task.time.minute).format(context), isTime: true,)),
            ],
          ),
          SizedBox(height: 8,),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Button(
                      text: "Edit ${task.type.name}",
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUpdateTasks(task: task,title: task.type.name,)));
                  }),
                  SizedBox(height: 16,),
                  SecondaryButton(
                      text: "Delete ${task.type.name}",
                      onPressed: (){}
                  )
                ],
              ),
            ),
          )
        ]
      ),
    );
  }
}
