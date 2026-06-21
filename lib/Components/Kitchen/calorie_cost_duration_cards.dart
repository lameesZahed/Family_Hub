import 'package:flutter/material.dart';

import '../../Models/Kitchen/calorie_cost_duration.dart';

class CalorieCostDurationCards extends StatelessWidget {
  final String? value;
  final CalorieCostDuration type;
  const CalorieCostDurationCards({super.key, required this.value, required this.type});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: (type == CalorieCostDuration.values[0])
              ?Color(0xff9B4747):
            (type == CalorieCostDuration.values[1])
                ?Color(0xff016B61): Color(0xff6E5C52)
        ),
        color:(type == CalorieCostDuration.values[0])
          ?Color(0xffC96868).withOpacity(0.3):
      (type == CalorieCostDuration.values[1])
          ?Color(0xff308983).withOpacity(0.3): Color(0xff6E5C52).withOpacity(0.3)
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
                (type == CalorieCostDuration.values[0])
                    ?Icons.local_fire_department:
                (type == CalorieCostDuration.values[1])
                    ?Icons.monetization_on: Icons.access_time_filled,
              size: 16,
            ),
            SizedBox(width: 4,),
            Text(value??"Not determinate"),
          ],
        ),
      ),

    );
  }
}
