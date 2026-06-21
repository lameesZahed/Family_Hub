import 'package:family_hub/Screens/Calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Models/Calendar/events_model.dart';

class OldCalendar extends StatefulWidget {
  final Function(DateTime,bool) onDaySelected;
  final DateTime selectedDay;
  final DateTime displayedMonth;
  final Function(DateTime) onMonthChanged;


  OldCalendar({
    super.key,
    required this.onDaySelected,
    required this.selectedDay,
    required this.displayedMonth,
    required this.onMonthChanged,
  });

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

  DateTime today = DateTime.now();
  DateTime selectedday = DateTime.now();

  List<DateTime> DaysInMonth(DateTime date) {
    List<DateTime> days = [];
    DateTime firstDay = DateTime(date.year, date.month, 1);
    DateTime lastDay = DateTime(date.year, date.month + 1, 0);
    int firstWeekday = firstDay.weekday % 7;
    for (int i = 0; i < firstWeekday; i++) {
      DateTime prev = firstDay.subtract(Duration(days: firstWeekday - i));
      days.add(prev);
    }
    for (int i = 1; i <= lastDay.day; i++) {
      days.add(DateTime(date.year, date.month, i));
    }
    return days;
  }

  String monthFormat(DateTime date) {
    return "${months[date.month - 1]} ${date.year}";
  }

  String dayFormat(DateTime date) {
    return "${date.day} ${months[date.month - 1]} ${date.year}";
  }

  @override
  State<OldCalendar> createState() => _TheCalendarState();
}

class _TheCalendarState extends State<OldCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Color(0xFF308983)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0,left: 16,right: 16,top: 8),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.monthFormat(widget.displayedMonth),
                  style: TextStyle(fontSize: 14),
                ),
                Spacer(),
                IconButton(
                  // سهم الشهر اللي فات
                  onPressed: () {
                    widget.onMonthChanged(
                      DateTime(
                        widget.displayedMonth.year,
                        widget.displayedMonth.month - 1,
                        1,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Color(0xFFFFF4EA).withOpacity(0.5),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFF6E5C52),
                    shape: CircleBorder(),
                    minimumSize: Size(16, 16),
                    iconSize: 16,
                  ),
                ),
                IconButton(
                  // سهم الشهر اللي فات
                  onPressed: () {
                    widget.onMonthChanged(
                      DateTime(
                        widget.displayedMonth.year,
                        widget.displayedMonth.month + 1,
                        1,
                      ),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFFFF4EA).withOpacity(0.5),
                  ),
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xFF6E5C52),
                    shape: CircleBorder(),
                    iconSize: 16,
                    minimumSize: Size(16, 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [
                for (String day in widget.week)
                  Expanded(
                    child: TextButton(
                      onPressed: null,
                      child: Text(
                        day.substring(0, 1),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6E5C52).withOpacity(0.7),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 8),
            daysGrid(),
          ],
        ),
      ),
    );
  }

  Widget daysGrid() {
    return SizedBox(
      height: 252,
      child: GestureDetector(
        onHorizontalDragEnd: (DragEndDetails details){
          if (details.primaryVelocity! > 0) { //swiping Right
            widget.onMonthChanged(
              DateTime(widget.displayedMonth.year, widget.displayedMonth.month - 1, 1),
            );
          } else if (details.primaryVelocity! < 0) { //swiping Left
            widget.onMonthChanged(
              DateTime(widget.displayedMonth.year, widget.displayedMonth.month + 1, 1),
            );
          }        },
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 6,
            // mainAxisSpacing: 4
          ),
          itemCount: widget.DaysInMonth(widget.displayedMonth).length,
          itemBuilder: (context, index) {
            DateTime day = widget.DaysInMonth(widget.displayedMonth)[index];
            // DateTime event = EventsModel().Events.keys.elementAt(index);
            // final bool isEvent = event.month == day.month;
            final bool isCurrentMonth =
                day.month == widget.displayedMonth.month;
            final bool isSelected =
                day.day == widget.selectedDay.day &&
                day.month == widget.selectedDay.month &&
                day.year == widget.selectedDay.year;
            final bool isEvent = EventsModel().Events.keys.any((eventDate) =>
            eventDate.year == day.year &&
                eventDate.month == day.month &&
                eventDate.day == day.day
            );
             int eventsLength = EventsModel().Events[widget.selectedDay]?.length?? 0;

            bool moreEvents= (eventsLength>2)? true: false ;

            return TextButton(
              onPressed: () {
                widget.onDaySelected(day,moreEvents);//صفحة ال calendar لما هتعمل setstate هتعيد جزء الكاليندر كله
              },

              style: TextButton.styleFrom(
                backgroundColor: isSelected
                    ? Color(0xFF308983)
                    : Colors.transparent,
              ),
              child: Text(
                "${day.day}",
                style: TextStyle(
                  color: Colors.transparent,
                  shadows: [
                    Shadow(
                      color: isSelected
                          ? Colors.white
                          : isCurrentMonth
                          ? Color(0xFF6E5C52)
                          : Color(0xFF6E5C52).withOpacity(0.5),
                      offset: Offset(0, -5),
                    ),
                  ],
                  decoration: (isEvent && !isSelected)?TextDecoration.underline:TextDecoration.none,
                  decorationColor: Color(0xFF308983).withOpacity(0.6),
                  decorationThickness: 2,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
