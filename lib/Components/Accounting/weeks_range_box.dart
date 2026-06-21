import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'box_decoration_accounting.dart';

class WeeksRangeBox extends StatefulWidget {
   WeeksRangeBox({super.key});

  @override
  State<WeeksRangeBox> createState() => _WeeksRangeBoxState();


}

class _WeeksRangeBoxState extends State<WeeksRangeBox> {
  DateTime CurrentDate = DateTime.now();
  late String formattedStart;
  late String formattedEnd;
  late DateTime FirstDayOfCurrentWeek;
  late DateTime EndDayOfCurrentWeek;

  @override
  void initState() {
    int CurrentWeek = CurrentDate.weekday;
    FirstDayOfCurrentWeek = CurrentDate.subtract(Duration(days: (CurrentWeek+1)%7));
    EndDayOfCurrentWeek = FirstDayOfCurrentWeek.add(Duration(days: 6));
    super.initState();
  }

  void AddWeek(){
    setState(() {
      FirstDayOfCurrentWeek = FirstDayOfCurrentWeek.add(Duration(days: 7));
      EndDayOfCurrentWeek = EndDayOfCurrentWeek.add(Duration(days: 7));
    });
  }

  void SubtractWeek(){
    setState(() {
      FirstDayOfCurrentWeek = FirstDayOfCurrentWeek.subtract(Duration(days: 7));
      EndDayOfCurrentWeek = EndDayOfCurrentWeek.subtract(Duration(days: 7));
    });
  }

  @override
  Widget build(BuildContext context) {
    formattedStart = DateFormat('MMMM d').format(FirstDayOfCurrentWeek);
    formattedEnd = DateFormat('MMMM d').format(EndDayOfCurrentWeek);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BoxDecorationAccounting(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: ()=>SubtractWeek(), icon: Icon(Icons.arrow_back_ios,color: Color(0xFF6E5C52),size: 18,),),
                Column(
                  children: [
                    Text("Billing Cycle",style: TextStyle(
                      color: Color(0xFF9B4747),
                      fontSize: 16
                    ),),
                    Text("$formattedStart - $formattedEnd",style: TextStyle(
                      color: Colors.black,
                      fontSize: 16
                    )),
                  ],
                ),
                IconButton(onPressed: ()=>AddWeek(), icon: Icon(Icons.arrow_forward_ios,color: Color(0xFF6E5C52),size: 18,),),
              ],
            ),
          )

      ),
    );
  }
}
