import 'package:flutter/material.dart';

class ExpandAlert extends StatelessWidget {
  final int? alertValue;
    ExpandAlert({super.key, required this.alertValue});

   List<int> alerts =[15,20,30,60,120];
   TextEditingController alert=TextEditingController();


   @override
   Widget build(BuildContext context) {
     alert.text = (alertValue !=null)?
     ((alertValue!>=60)?"${alertValue!~/60} hour before":"$alertValue minutes before"):"";
     return DropdownMenu(
       controller: alert,
         width: double.infinity,
         hintText: "Select Alert Time",
         enableSearch: false,
         dropdownMenuEntries: [
           for(int i in alerts)
             DropdownMenuEntry(
                 value: i,
                 label: (i>=60)?"${i~/60} hours before": "$i minutes before"
             )
         ]
     );
   }

}





