import 'package:family_hub/Components/Calendar/event_card.dart';
import 'package:family_hub/Components/Calendar/old_calendar.dart';
import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Components/Menu/Drawer/main_drawer.dart';
import 'package:family_hub/Models/Calendar/events_model.dart';
import 'package:family_hub/Screens/Calendar/edit_add_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Calendar/calendar_picker.dart';
import '../../Components/Calendar/header.dart';
import '../../Models/Calendar/event.dart';
import 'Details/see_all_events.dart';

class Calendar extends StatefulWidget {
  Calendar({super.key});





  DateTime selected_day = DateUtils.dateOnly(DateTime.now());











  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  bool expand = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(),
      floatingActionButton: AddButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditAddEvent()));
        },

      ),
      body: Body(),
    );
  }

  Widget Body() {
    return Column(
      children: [
        CalendarPicker(
          selectedDate: widget.selected_day,
          onDateChanged: (value){
            setState(() {
              widget.selected_day = value;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(height: 16,),
              Header(
                  expand: expand,
                  date: widget.selected_day,
                onViewMore: (value){
                    setState(() {
                      expand = value;
                    });
                }
              ),
              SizedBox(height: 24,),
              Visibility(
                  visible: expand,
                  child: ListEvents(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Widget Header(DateTime date) {
  //   return Container(
  //     decoration: BoxDecoration(
  //       color: Color(0xFFC96868),
  //       borderRadius: BorderRadius.circular(48),
  //     ),
  //     child: Padding(
  //       padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
  //       child: Row(
  //         children: [
  //           Text(
  //           widget.header(date),
  //             style: TextStyle(color: Color(0xFF221F1F), fontSize: 16),
  //           ),
  //           IconButton(
  //             onPressed: () {
  //               setState(() {
  //                 widget.expand = !widget.expand;
  //               });
  //             },
  //             icon: (widget.expand
  //                 ? Icon(Icons.arrow_drop_down_outlined)
  //                 : Icon(Icons.arrow_drop_up_outlined)),
  //           ),
  //           Spacer(),
  //           IconButton(
  //             onPressed: () {},
  //             icon: SvgPicture.asset("assets/Icons/Calendar.svg"),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget ListEvents() {
    int EventsLength = EventsModel().Events[DateUtils.dateOnly(widget.selected_day)]?.length?? 0;
    return Column(
      children: [
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: (EventsModel().Events[widget.selected_day]?.length ==null)? 0:2,
          itemBuilder: (context, index) {
            Event events = EventsModel().Events[widget.selected_day]![index];
            return EventCard(
              title: events.name,
              description: events.description,
              date: widget.selected_day,
            );
          },
        ),
        (EventsLength>2)?
        TextButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SeeAllEvents(selected_day: widget.selected_day)));
            },
            child: Text("View all events",style: TextStyle(color:Color(0xFFC96868) ),)) :
        (EventsLength==0)?
        Text("No Events Yet"):SizedBox()

      ],
    );
  }
}
