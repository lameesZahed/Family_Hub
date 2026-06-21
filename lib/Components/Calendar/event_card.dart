import 'package:family_hub/Models/Calendar/events_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Screens/Calendar/view_event.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final DateTime date;
  EventCard({super.key, required this.title, required this.description, required this.date});


  late TimeOfDay currentTime;
  late int currenAlert;

  void setCurrentTimeAlert(){
    for(int i=0;i<EventsModel().Events[date]!.length;i++){
      if(EventsModel().Events[date]![i].name==title){
        currentTime = EventsModel().Events[date]![i].time;
        currenAlert = EventsModel().Events[date]![i].alert;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    setCurrentTimeAlert();
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
          ),
          title: Text(title),
          subtitle: Text(
            currentTime.format(context),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
          leading: Icon(Icons.calendar_month),
          titleTextStyle: TextStyle(
            color: Color(0xFF9B4747),
            fontWeight: FontWeight.normal,
            fontSize: 14
          ),
          subtitleTextStyle: TextStyle(
            color: Color(0xFF6E5C52),
            fontSize: 12
          ),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewEvent(
              name: title,
              description: description,
              time: currentTime,
              date: date,
              alert: currenAlert,
            )));
          },
        ),
      ),
    );

  }
}
