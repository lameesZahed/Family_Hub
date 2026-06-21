import 'package:flutter/material.dart';
import 'package:graphview/GraphView.dart';

class TimeRangeButtons extends StatefulWidget {
  TimeRangeButtons({super.key});

  @override
  State<TimeRangeButtons> createState() => _TimeRangeButtonsState();
}

class _TimeRangeButtonsState extends State<TimeRangeButtons> {
  TimeRange selected = TimeRange.Today;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        timeRangeButton(TimeRange.Today),
        timeRangeButton(TimeRange.Week,),
        timeRangeButton(TimeRange.Month),
      ],
    );
  }



  Widget timeRangeButton(TimeRange timeRange){
    bool isActive = selectedIndex ==timeRange.index;
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = timeRange.index;
        });
      },
      child: Container(
        padding: EdgeInsets.all(8),
        width: 104,
        decoration: BoxDecoration(
          color: (isActive)?const Color(0xFF308983).withOpacity(0.2):Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            (isActive)? BoxShadow(
              color: Colors.transparent,
            ):BoxShadow(
              color: Colors.black.withOpacity(0.25),
              blurRadius: 4,
              offset: Offset(0, 0),
            )
          ],
          border: Border.all(
                  color: (isActive)?const Color(0xFF308983):Colors.transparent,
                  width: 1
          ),
        ),
        child: Text(timeRange.name,style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: (isActive)?const Color(0xFF308983):Color(0xff9B4747),
        ),
          textAlign: TextAlign.center,

        ),
      ),
    );
  }



}


enum TimeRange {
  Today,
  Week,
  Month,
}

// SegmentedButton(
//         segments: [
//           ButtonSegment(value: TimeRange.Today ,label: Text(TimeRange.Today.name)),
//           ButtonSegment(value: TimeRange.Week ,label: Text(TimeRange.Week.name) ),
//           ButtonSegment(value: TimeRange.Month ,label: Text(TimeRange.Month.name) )
//         ],
//         selected: {selected},
//       onSelectionChanged: (value){
//           setState(() {
//             selected = value.first;
//           });
//       },
//     );
