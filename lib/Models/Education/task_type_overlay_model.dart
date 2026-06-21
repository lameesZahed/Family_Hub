import 'package:family_hub/Models/Education/task.dart';
import 'package:family_hub/Models/Education/task_type_for_overlay.dart';

class TaskTypeOverlayModel{
  List <TaskTypeForOverlay> taskTypes=[
    TaskTypeForOverlay(type: taskType.Course, icon: "assets/Icons/Education/course.svg"),
    TaskTypeForOverlay(type: taskType.Lesson, icon: "assets/Icons/Education/lesson.svg"),
    TaskTypeForOverlay(type: taskType.Project, icon: "assets/Icons/Education/Project.svg"),
  ];
}