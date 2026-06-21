import 'package:flutter/material.dart';

import 'event.dart';

class EventsModel {

  //name - description - date - time - alert

  Map <DateTime,List<Event>> Events = {
    DateTime(2026, 06, 25): [
      Event(
          name:"Birthday16",
          description: "Big party at my sister's house remember the gift",
          time:  TimeOfDay(hour: 19, minute: 0), //7
          alert: 30
      ),
      Event(
       name:"Lamees’s Party",
       description: "Don't forget to bring the coffee cake and the project presentation slides. We will be meeting in the conference room",
        time:  TimeOfDay(hour: 19, minute: 0), //7
       alert:  15
      ),
      Event(
         name:  "Halloween",
         description:  "pick up the costume from the store and get ready for the party ",
         time:  TimeOfDay(hour: 21, minute: 0), //7
         alert:  15
      )
    ],
    DateTime(2026, 6, 24): [
      Event(
          name:"Birthday15",
          description: "Big party at my sister's house remember the gift",
          time:  TimeOfDay(hour: 19, minute: 0), //7
          alert:  15
      ),
      Event(
          name:  "Halloween",
          description:  "pick up the costume from the store and get ready for the party ",
          time:  TimeOfDay(hour: 21, minute: 0), //7
          alert:  20
      )
    ],
    DateTime(2026, 3, 14): [
      Event(
          name:"Birthday14",
          description: "Big party at my sister's house remember the gift",
          time:  TimeOfDay(hour: 19, minute: 0), //7
          alert:  15
      ),
      Event(
          name:  "Halloween",
          description:  "pick up the costume from the store and get ready for the party ",
          time:  TimeOfDay(hour: 21, minute: 0), //7
          alert:  60
      )
    ],
    DateTime(2026, 3, 13): [
      Event(
          name:"Birthday13",
          description: "Big party at my sister's house remember the gift",
          time:  TimeOfDay(hour: 19, minute: 0), //7
          alert:  120
      ),
      Event(
          name:  "Halloween",
          description:  "pick up the costume from the store and get ready for the party ",
          time:  TimeOfDay(hour: 21, minute: 0), //7
          alert:  60
      )
    ],
    DateTime(2026, 6, 14): [
      Event(
          name:"Birthday4",
          description: "Big party at my sister's house remember the gift",
          time:  TimeOfDay(hour: 19, minute: 0), //7
          alert:  15
      ),
      Event(
          name:  "Halloween",
          description:  "pick up the costume from the store and get ready for the party ",
          time:  TimeOfDay(hour: 21, minute: 0), //7
          alert:  15
      )
    ],
    DateTime(2026, 06, 12): [
      Event(
          name:"Lamees’s Party",
          description: "Don't forget to bring the coffee cake and the project presentation slides. We will be meeting in the conference room ",
          time:  TimeOfDay(hour: 19, minute: 0), //7
          alert:  60
      ),
      Event(
          name:  "Halloween16",
          description:  "pick up the costume from the store and get ready for the party ",
          time:  TimeOfDay(hour: 21, minute: 0), //7
          alert:  120
      ),
      Event(
          name:"Birthday15",
          description: "Big party at my sister's house remember the gift",
          time:  TimeOfDay(hour: 19, minute: 0), //7
          alert:  15
      ),
      Event(
          name:  "Halloween",
          description:  "pick up the costume from the store and get ready for the party ",
          time:  TimeOfDay(hour: 21, minute: 0), //7
          alert:  20
      )
    ],
  };
}
