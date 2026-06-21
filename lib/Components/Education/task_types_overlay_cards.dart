import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../Models/Education/task_type_for_overlay.dart';
import '../../Screens/Education/add_update_tasks.dart';

class TaskTypesOverlayCards extends StatelessWidget {
  final TaskTypeForOverlay taskTypeItem;
  const TaskTypesOverlayCards({super.key, required this.taskTypeItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Text(taskTypeItem.type.name,style: TextStyle(
            color: Color(0xff6E5C52),
            fontSize: 16,
            // fontWeight: FontWeight.bold
          ),),
          leading: SvgPicture.asset(taskTypeItem.icon,color: Color(0xff9B4747),),
          onTap: (){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>AddUpdateTasks(title: taskTypeItem.type.name)));
          },
        ),
      ),
    );
  }
}
