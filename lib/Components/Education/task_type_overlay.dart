import 'package:family_hub/Components/Education/task_types_overlay_cards.dart';
import 'package:family_hub/Models/Education/task_type_for_overlay.dart';
import 'package:flutter/material.dart';

import '../../Models/Education/task_type_overlay_model.dart';
class TaskTypeOverlay extends StatelessWidget {
  const TaskTypeOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Color(0xFFFFF4EA),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )
      ),
      child: TaskTypeOverlayBody(),
    );
  }

  Widget TaskTypeOverlayBody(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Container(
            height: 4,
            width: 60,
            decoration: BoxDecoration(
              color: Color(0xff6E5C52).withOpacity(0.8),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        taskTypeList(),
      ],
    );
  }



  Widget taskTypeList(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: TaskTypeOverlayModel().taskTypes.length,
        itemBuilder: (context,index){
          return TaskTypesOverlayCards(
            taskTypeItem: TaskTypeOverlayModel().taskTypes[index],
          );
      }),
    );
  }



}
