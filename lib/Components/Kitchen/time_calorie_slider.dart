import 'package:family_hub/Models/Kitchen/calorie_cost_duration.dart';
import 'package:flutter/material.dart';

class TimeSlider extends StatefulWidget {
  final int value;
  final int max;
  final CalorieCostDuration type;
  const TimeSlider({required this.value, super.key, required this.max, required this.type});

  @override
  State<TimeSlider> createState() => _TimeSliderState();



}



class _TimeSliderState extends State<TimeSlider> {
  late double currentValue;
  @override
  void initState() {
    currentValue = widget.value.toDouble();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              (widget.type == CalorieCostDuration.Calorie)?"Calories":"Cooking Duration",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(width: 8),
            Text(
              (widget.type == CalorieCostDuration.Duration)?"(in minutes)":"",
              style: TextStyle(
                color: Color(0xFF9B4747).withOpacity(0.5),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "0>",
              style: TextStyle(
                color: Color(0xFF6E5C52).withOpacity(0.5),
                fontSize: 14,
              ),
            ),
            Text(
              "< ${widget.max}",
              style: TextStyle(
                color: Color(0xFF6E5C52).withOpacity(0.5),
                fontSize: 14,
              ),
            ),
          ],
        ),
        Slider(
            divisions: (widget.type == CalorieCostDuration.Calorie)?1000:60,
            label: "${currentValue.toInt()}",
            max: widget.max.toDouble(),
            min: 0,
            value: currentValue,
            onChanged: (value){
              setState(() {
                currentValue = value;
              });
            }
        ),
      ],
    );
  }
}
