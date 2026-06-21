import 'package:family_hub/Components/Education/time_calendar_cards.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddUpdateTimer extends StatefulWidget {
   TimeOfDay time;
  AddUpdateTimer({super.key, required this.time});

  @override
  State<AddUpdateTimer> createState() => _AddUpdateTimerState();
}

class _AddUpdateTimerState extends State<AddUpdateTimer> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Time",
            style: TextStyle(color: Color(0xff6E5C52), fontSize: 20),
          ),
          SizedBox(height: 8),
          TimeCalendarCards(
              data: widget.time.format(context),
              icon: Icons.access_time,
              onTap: Timer
          )
        ],
      ),
    );
  }



   Timer() async {
    TimeOfDay? selectedTime = await showTimePicker(
        context: context,
        initialTime: widget.time,
    );
    if(selectedTime != null){
      setState(() {
        widget.time = selectedTime;
      });
    }

  }


//   CupertinoDatePicker(
//   backgroundColor: Colors.white,
//   onDateTimeChanged: (DateTime newDateTime) {},
//   mode: CupertinoDatePickerMode.time,
//   initialDateTime: DateTime(2018, 9, 15),
//   selectionOverlayBuilder: (
//       BuildContext context, {
//         required int selectedIndex,
//         required int columnCount,
//       }) {
//     if (selectedIndex == 0) {
//       return const CupertinoPickerDefaultSelectionOverlay(
//         capEndEdge: false,
//       );
//     } else if (selectedIndex == columnCount - 1) {
//       return const CupertinoPickerDefaultSelectionOverlay(
//         capStartEdge: false,
//       );
//     }
//     return const CupertinoPickerDefaultSelectionOverlay(
//       capStartEdge: false,
//       capEndEdge: false,
//     );
//   },
// );
//   CupertinoPicker(
//   itemExtent: 80,
//   squeeze: 4,
//   // magnification: 1,
//   looping: true,
//   useMagnifier: true,
//   onSelectedItemChanged: (index) {},
//   children: hours,
// );



// builder: (context,child){
//           return TimePickerTheme(
//               data: TimePickerThemeData(
//                 backgroundColor: Color(0xFFFFF4EA),
//                 cancelButtonStyle: TextButton.styleFrom(
//                   foregroundColor: Color(0xFF696666),
//                 ),
//                 confirmButtonStyle: TextButton.styleFrom(
//                   foregroundColor: Color(0xFFC96868),
//                 ),
//                 dayPeriodTextColor: WidgetStateColor.resolveWith((states){
//                   if(states.contains(MaterialState.selected)){
//                     return Color(0xFFC96868);
//                   }
//                   else{
//                     return Color(0xFF696666);
//                   }
//         },),
//                 dialHandColor: Color(0xFFC96868),
//                 dialBackgroundColor: Colors.white,
//                 timeSelectorSeparatorColor: WidgetStatePropertyAll<Color>(Color(0xff6E5C52)),
//                 hourMinuteColor: WidgetStateColor.resolveWith((states){
//                   if(states.contains(MaterialState.selected)){
//                     return Color(0xFFC96868).withOpacity(0.2) ;
//                   }
//                   else{
//                     return Colors.white;
//                   }
//                 }),
//                 hourMinuteTextColor: WidgetStateColor.resolveWith((states){
//                   if(states.contains(MaterialState.selected)){
//                     return Color(0xFFC96868);
//                   }
//                   else{
//                     return Colors.black;
//                   }
//                 }),
//                 dayPeriodColor: Color(0xFFC96868).withOpacity(0.2),
//                 hourMinuteTextStyle: TextStyle(
//                   fontSize: 32
//                 ),
//                 hourMinuteShape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16)
//                 ),
//                 inputDecorationTheme: InputDecorationTheme(
//                   filled: true,
//                   enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide.none,
//                     borderRadius: BorderRadius.circular(8),
//                 ),
//                   focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Color(0xFFC96868),
//                     ),
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                 )
//               ),
//               child: child!
//           );
//       }

}
