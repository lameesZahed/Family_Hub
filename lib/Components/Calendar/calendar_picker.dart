import 'package:flutter/material.dart';

class CalendarPicker extends StatelessWidget {
  DateTime selectedDate;
  final Function(DateTime) onDateChanged;
  CalendarPicker({super.key, required this.selectedDate, required this.onDateChanged});


  @override
  Widget build(BuildContext context) {
    return CalendarDatePicker(
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2030),
        onDateChanged: (value){
          selectedDate = value;
          onDateChanged(value);
          // print(selectedDate);
        }
    );
  }
}
