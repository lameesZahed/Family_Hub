import 'package:flutter/material.dart';


class ExpandTime extends StatefulWidget {
  TimeOfDay time;
  final TimeOfDay Function(TimeOfDay) onSelection;
   ExpandTime({super.key, required this.time, required this.onSelection});

  @override
  State<ExpandTime> createState() => _ExpandTimeState();
}

class _ExpandTimeState extends State<ExpandTime> {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
SizedBox(
  height: 100,
    width: 100,
    child: listWheelHours(
        controllerHours,
        Hours,
    ),

),
          Text(":"),
          SizedBox(
            height: 100,
            width: 100,
            child: listWheelMinutes(
                controllerMinutes,
                Minutes
            ),

          ),
          Text(":"),
          SizedBox(
            height: 100,
            width: 100,
            child: listWheelAmPm(
                controllerAmPm,
                AMPM
            ),

          )
        ],
      ),
    );
  }

  List<int> Hours = List.generate(12, (i)=>i+1);
  List<int> Minutes = List.generate(59, (i)=>i+1);
  List AMPM = ["AM","PM"];

  FixedExtentScrollController controllerHours = FixedExtentScrollController();
  FixedExtentScrollController controllerMinutes = FixedExtentScrollController();
  FixedExtentScrollController controllerAmPm = FixedExtentScrollController();



  Widget listWheelHours(FixedExtentScrollController controller,List<int> values){
    return ListWheelScrollView(
      controller: controller,
        itemExtent: 32,
        onSelectedItemChanged: (i){
          setState(() {
            widget.time = TimeOfDay(hour: Hours[i], minute: widget.time.minute);
            widget.onSelection(widget.time);
          });
        },
        physics: FixedExtentScrollPhysics(),
        children: Hours.map((Time){
          final isSelected = Time == widget.time.hour;
          return TextButton(
              onPressed: (){
                int targetIndex = Hours.indexOf(Time);
                controller.animateToItem(targetIndex, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                setState(() {
                  widget.time = TimeOfDay(hour: Time, minute: widget.time.minute);
                  widget.onSelection(widget.time);
                });
              },
              child: Text(Time.toString().padLeft(2,'0'),style: TextStyle(
                color: isSelected? Color(0xFFC96868) : Color(0xFF94A3B8),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal

              ))
          );
        }).toList()
    );
  }

  Widget listWheelMinutes(FixedExtentScrollController controller,List<int> values){
    return ListWheelScrollView(
        controller: controller,
        itemExtent: 32,
        onSelectedItemChanged: (i){
          setState(() {
            widget.time = TimeOfDay(hour: widget.time.hour, minute: Minutes[i]);
            widget.onSelection(widget.time);
          });
        },
        physics: FixedExtentScrollPhysics(),
        children: Minutes.map((Time){
          final isSelected = Time == widget.time.minute;
          return TextButton(
              onPressed: (){
                int targetIndex = Hours.indexOf(Time);
                controller.animateToItem(targetIndex, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
                setState(() {
                  widget.time = TimeOfDay(hour: widget.time.hour, minute: Time);
                  widget.onSelection(widget.time);
                });
              },
              child: Text(Time.toString().padLeft(2,'0'),style: TextStyle(
                color: isSelected? Color(0xFFC96868) : Color(0xFF94A3B8),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal

              ))
          );
        }).toList()
    );
  }

  Widget listWheelAmPm(FixedExtentScrollController controller,List values){
    return ListWheelScrollView(
        controller: controller,
        itemExtent: 32,
        onSelectedItemChanged: (i){
          setState(() {
          });
        },
        physics: FixedExtentScrollPhysics(),
        children: AMPM.map((period){
          final bool isSelected = (period == "AM" && widget.time.period == DayPeriod.am) ||
              (period == "PM" && widget.time.period == DayPeriod.pm);
          return TextButton(onPressed: () {
           int targetIndex = AMPM.indexOf(period);
           controller.animateToItem(targetIndex, duration: Duration(milliseconds: 500), curve: Curves.easeInOut);

           setState(() {
             updatePeriod(period);
           });
         },
            child: Text(period,style: TextStyle(
            color:isSelected? Color(0xFFC96868) : Color(0xFF94A3B8),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal

          )),);
        }).toList()
    );
  }

  void updatePeriod(String period) {
    final isPm = period == "PM";
    final hourOfPeriod = widget.time.hourOfPeriod;

    int newHour;
    if (isPm) {
      newHour = (hourOfPeriod == 12) ? 12 : hourOfPeriod + 12;
    } else {
      newHour = (hourOfPeriod == 12) ? 0 : hourOfPeriod;
    }

    widget.time = TimeOfDay(hour: newHour, minute: widget.time.minute);
    widget.onSelection(widget.time);
  }


}
