import 'package:flutter/material.dart';

class ExpandCalendar extends StatefulWidget {
   DateTime selectedDDay;
   DateTime Function (DateTime) onSelection;

   ExpandCalendar({super.key, required this.selectedDDay,required this.onSelection});

  @override
  State<ExpandCalendar> createState() => _ExpandCalendarState();
}

class _ExpandCalendarState extends State<ExpandCalendar> {
  List<String> week = [
    "Sunday",
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Satuday",
  ];

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  DateTime displayedMonth = DateTime.now();


  List<DateTime> DaysInMonth(DateTime date){
    List<DateTime> days = [];
    DateTime firstDay = DateTime(date.year, date.month, 1);
    DateTime lastDay = DateTime(date.year, date.month + 1, 0);
    int firstWeekday = firstDay.weekday % 7;

    for(int i =0; i < firstWeekday ; i++){
      DateTime prev = firstDay.subtract(Duration(days: firstWeekday - i));
      days.add(prev);
    }

    for(int i = 1; i <= lastDay.day; i++){
      days.add(DateTime(date.year, date.month, i));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(12),
            bottomLeft: Radius.circular(12),
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: (){
                    setState(() {
                      displayedMonth = DateTime(displayedMonth.year,displayedMonth.month-1,1);
                    });
                  },
                  icon: Icon(Icons.arrow_back_ios_new,size: 16,),
                ),
                // Spacer(),

                Text("${months[displayedMonth.month-1]} ${displayedMonth.year}",style: TextStyle(
                  color: Color(0xFF0F172A),
                    fontWeight: FontWeight.bold,
                  fontSize: 14
                ),),
                // Spacer(),
                IconButton(
                  onPressed: (){
                    setState(() {
                      displayedMonth = DateTime(displayedMonth.year,displayedMonth.month+1,1);

                    });
                  },
                  icon: Icon(Icons.arrow_forward_ios,size: 16,),
                ),
              ],
            ),
            SizedBox(height: 8,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for(String day in week)
                    Row(
                      children: [
                        Text(day.substring(0,1),style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontWeight: FontWeight.bold,
                        ),),
                        // SizedBox(width: 10,)
                      ],
                    )
                ],
              ),
            ),
            // gridWeekDays(),
            SizedBox(height: 8,),
            gridDaysCalendar()
          ],
        ),
      )

    );
  }

  // Widget gridWeekDays(){
  Widget gridDaysCalendar(){
    return GestureDetector(
      onHorizontalDragEnd: (DragEndDetails details){
        if(details.primaryVelocity!>0){
setState(() {
  displayedMonth = DateTime(displayedMonth.year,displayedMonth.month-1,1);

});
        }
        else if(details.primaryVelocity!<0){
setState(() {
  displayedMonth = DateTime(displayedMonth.year,displayedMonth.month+1,1);

});
        }

      },
      child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: DaysInMonth(displayedMonth).length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 6,
            mainAxisExtent: 32,
          ),
          itemBuilder: (context, index){
            DateTime day = DaysInMonth(displayedMonth)[index];
            bool currentMonth = day.month ==displayedMonth.month;
            final bool isSelected =
                day.day == widget.selectedDDay.day &&
                    day.month == widget.selectedDDay.month &&
                    day.year == widget.selectedDDay.year;
            return TextButton(
              style: TextButton.styleFrom(
                backgroundColor: (isSelected)? Color(0xFFC96868) : Colors.transparent
              ),
                onPressed: (){
                setState(() {
                  widget.selectedDDay = day;
                  widget.onSelection(day);
                });
                },
                child: Text("${day.day}",style: TextStyle(
                  color:
                  isSelected? Colors.white:
                  currentMonth? Color(0xFF0F172A)
                      : Color(0xFFCBD5E1),
                  fontWeight: FontWeight.normal,
                  fontSize: 12
                ),)
            );
          }
      ),
    );
  }
}

