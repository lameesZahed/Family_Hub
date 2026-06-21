import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepProgressIndecator extends StatelessWidget {
  final int index;
  const StepProgressIndecator({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 1; i < 4; i++)...[
            Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: (i <= index) ? Color(0xFF9B4747) : Colors.grey,
                  width: 2
                ),
                color: (i < index) ? Color(0xFF9B4747) : Colors.transparent
              ),
              child:
              (i == index)?Icon(Icons.circle,color: Color(0xFF9B4747),size: 12,)
              :(i< index)?Icon(Icons.check,color: Colors.white,)
                  :null
            ),
            if (i < 3)
              Expanded(
                child: Container(
                  height: 2,
                  color: (i <= index) ? Color(0xFF9B4747) : Colors.grey,
                ),
              )
          ]

        ],
      ),
    );
  }
}
