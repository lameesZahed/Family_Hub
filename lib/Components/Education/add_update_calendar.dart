import 'package:family_hub/Components/Education/time_calendar_cards.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class AddUpdateCalendar extends StatefulWidget {
   DateTime date;
   AddUpdateCalendar({super.key, required this.date});

  @override
  State<AddUpdateCalendar> createState() => _AddUpdateCalendarState();
}

class _AddUpdateCalendarState extends State<AddUpdateCalendar> {
  late DateTime firstDate;
  @override
  void initState() {
    firstDate = widget.date;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical:8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Deadline",style: TextStyle(
            color: Color(0xff6E5C52),
            fontSize: 20,
          )),
          SizedBox(height: 8,),
          TimeCalendarCards(
              data: DateFormat("MMMM d, yyy").format(widget.date),
              icon: Icons.calendar_month,
              onTap: Date
          )
        ],
      ),
    );
  }

   Date() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: widget.date,
      firstDate: firstDate,
      lastDate: DateTime(2030),


    );
    if (selectedDate != null) {
      setState(() {
        widget.date = selectedDate;
      });
    }
  }
}


//      builder: (context,child){
//         return Theme(
//           data: Theme.of(context).copyWith(
//             inputDecorationTheme: InputDecorationTheme(
//                 hintStyle: TextStyle(
//                   color: Color(0xffC4B7A6),
//                 ),
//                 labelStyle: TextStyle(
//                   color: Color(0xFF308983),),
//                 // border: OutlineInputBorder(
//                 //   borderRadius: BorderRadius.circular(16),
//                 //   borderSide: BorderSide(
//                 //     color: Color(0xFF308983),
//                 //   ),
//                 // ),
//                 // activeIndicatorBorder: BorderSide(
//                 //   color: Color(0xFF308983),
//                 // ),
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(
//                     color: Color(0xFF308983),
//                   ),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(16),
//                   borderSide: BorderSide(
//                     color: Color(0xFF308983),
//                     width: 2,
//                   ),)
//             ),
//           ),
//           child: DatePickerTheme(
//               data: DatePickerThemeData(
//                 backgroundColor: Color(0xFFFFF4EA),
//                 headerForegroundColor: Color(0xFFC96868) ,
//                 todayForegroundColor: WidgetStateColor.resolveWith((states){
//                   if(states.contains(MaterialState.selected)){
//                     return Colors.white;
//                   }
//                   if(states.contains(MaterialState.disabled)){
//                     return Colors.grey;
//                   }
//                   else{
//                     return Color(0xff6E5C52);}
//                 }),
//                 todayBackgroundColor: WidgetStateColor.resolveWith((states){
//                   if(states.contains(MaterialState.selected)){
//                     return Color(0xFFC96868);
//                   }
//                   // else if(states.contains(MaterialState.focused)){
//                   // return Color(0xFFC96868);
//                   // }
//                   else{
//                     return Colors.transparent;
//                   }
//                 }),
//                 // dayOverlayColor: WidgetStateColor.resolveWith((states){
//                 //   return Colors.white;
//                 // }),
//                 dayForegroundColor: WidgetStateColor.resolveWith((states){
//                   if(states.contains(MaterialState.selected)){
//                     return Colors.white;
//                   }
//                   else if(states.contains(MaterialState.disabled)){
//                     return Colors.grey;
//                   }
//                   else{
//                     return Color(0xff6E5C52);
//                   }
//           },),
//                 dayBackgroundColor: WidgetStateColor.resolveWith((states){
//                   if(states.contains(MaterialState.selected)){
//                     return Color(0xFFC96868);
//                   }
//                   // else if(states.contains(MaterialState.focused)){
//                   // return Color(0xFFC96868);
//                   // }
//                   else{
//                     return Colors.transparent;
//                   }
//                 }),
//                 yearBackgroundColor: WidgetStateColor.resolveWith((states){
//                   if(states.contains(MaterialState.selected)){
//                     return Color(0xFFC96868);
//                   }
//                   // else if(states.contains(MaterialState.focused)){
//                   // return Color(0xFFC96868);
//                   // }
//                   else{
//                     return Colors.transparent;
//                   }
//                 }),
//                 // yearShape: WidgetStateOutlinedBorder.resolveWith((states){
//                 //   return RoundedRectangleBorder(
//                 //     borderRadius: BorderRadius.circular(16),
//                 //   );
//                 // }),
//                 cancelButtonStyle: TextButton.styleFrom(
//                   foregroundColor: Color(0xFF696666),
//                 ),
//                 confirmButtonStyle: TextButton.styleFrom(
//                   foregroundColor: Color(0xFFC96868),
//                 ),
//
//               ),
//               child: child!
//           ),
//         );
//       }