import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Models/Education/task.dart';
import '../../Screens/Education/add_update_tasks.dart';
import '../../Screens/Education/view_task.dart';

class TasksCards extends StatefulWidget {
  final Task task;
  const TasksCards({super.key, required this.task});

  @override
  State<TasksCards> createState() => _TasksCardsState();
}

class _TasksCardsState extends State<TasksCards> {
  late bool isDone;
  late String icon;

  @override
  void initState() {
    isDone = widget.task.isDone;
    icon = (widget.task.type==taskType.Course)?"assets/Icons/Education/course.svg":
    (widget.task.type==taskType.Lesson)?"assets/Icons/Education/lesson.svg":
    "assets/Icons/Education/Project.svg";
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Slidable(
        endActionPane: ActionPane(
          dismissible: DismissiblePane(onDismissed: () {  },key: UniqueKey(),),
          motion: DrawerMotion(),
          children: [
            SlidableAction(
              icon: Icons.edit,
              label: "Edit",
              backgroundColor: Color(0xFF308983),
              onPressed: (context){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>AddUpdateTasks(task: widget.task,title: widget.task.type.name??"")));
              },
              flex: 2,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
            ),
            SlidableAction(
              icon: Icons.delete,
              label: "Delete",
              flex: 1,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
              onPressed: (context){},
            )
          ],
        ),
        child: Card(
          color: Colors.white,
          child: CheckboxListTile(
            enableFeedback: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12)
            ),
            title: GestureDetector(
              onTap: (){
                Navigator.push(context, (MaterialPageRoute(builder: (context)=>ViewTask(task: widget.task))));
              },
              child: Text(widget.task.type.name,style: TextStyle(
                color: Color(0xffC4B7A6),
                fontSize: 12,
              ),),
            ),
              subtitle: GestureDetector(
                onTap: (){
                  Navigator.push(context, (MaterialPageRoute(builder: (context)=>ViewTask(task: widget.task))));
                },
                child: Text(widget.task.title,style: TextStyle(
                  color: Color(0xff6E5C52),
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),),
              ),
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Color(0xFFC96868),
              checkColor: Colors.white,
              side: BorderSide(
                color: Color(0xFFC96868),
                width: 2,
              ),
              secondary: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color(0xFF308983),
                ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(icon),
                  )
              ),
              value: isDone,
              onChanged: (value){
                setState(() {
                  isDone=value!;
                });
              }
          ),
        ),
      ),
    );
  }
}
