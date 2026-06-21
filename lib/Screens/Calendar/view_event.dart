import 'package:family_hub/Components/Calendar/view_event_cards.dart';
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Components/Customized%20Buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import 'edit_add_event.dart';

class ViewEvent extends StatelessWidget {
  final String name;
  final String description;
  final TimeOfDay time;
  final DateTime date;
  final int alert;
  const ViewEvent({
    super.key,
    required this.name,
    required this.description,
    required this.time,
    required this.alert,
    required this.date,
  });


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "My Event"),
      endDrawer: MainDrawer(),

      body: Body(context),
    );
  }

  Widget Body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Color(0xFF9B4747),
                      fontSize: 24,
                      fontWeight: FontWeight.normal,
                    ),
                    // textDirection: TextDirection.ltr,
                  ),
                ],
              ),
            ),
            ViewCards(
              type: "DESCRIPTION",
              text: description
            ),
            Row(
              children: [
                Expanded(
                  child: ViewCards(
                    type: "Date",
                    text: DateFormat("MMM dd, yyyy").format(date),
                    icon: Icons.calendar_month,
                  ),
                ),
                SizedBox(width: 16,),
                Expanded(
                  child: ViewCards(
                    type: "Time",
                    text: time.format(context),
                    icon: Icons.watch_later_outlined,
                  ),
                ),
              ],
            ),
            ViewCards(
              type: "Reminder Alert",
              text:(alert>=60)?"${alert~/60} hour before":"$alert minutes before",
              icon: Icons.notifications_none_rounded,
            ),
            SizedBox(height: 32,),
            Button(
                text: "Edit Event",
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>EditAddEvent(
                    name: name,
                    description: description,
                    time: time,
                    date: date,
                    alert: alert,
                  )));
                }
            ),
            SizedBox(height: 16,),
            SecondaryButton(
                text: "Delete Event",
                onPressed: (){}
            )

          ],
        ),
      ),
    );
  }



}
