import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Calendar/event_card.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Models/Calendar/events_model.dart';

class SeeAllEvents extends StatelessWidget {
  final DateTime selected_day;
   SeeAllEvents({super.key, required this.selected_day});



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: MainAppBar(title: "All Events"),
      endDrawer: MainDrawer(),
      body: EventsList() ,
    );
  }


  Widget EventsList(){
    // DateTime selectedDay = DateTime(selected_day.year,selected_day.month,selected_day.day);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: EventsModel().Events[selected_day]!.length,
        itemBuilder: (context, index) {
          return EventCard(
            title: EventsModel().Events[selected_day]![index].name,
            description: EventsModel().Events[selected_day]![index].description,
            date: selected_day,
          );
        },
      ),
    );
  }





}
