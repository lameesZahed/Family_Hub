import 'package:flutter/material.dart';

class ViewTaskCards extends StatelessWidget {
  final String title;
  final String description;
  final bool? isTime;
  const ViewTaskCards({super.key, required this.title, required this.description, required this.isTime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Color(0xffD0CECE),
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(
                color: Color(0xff9B4747),
                fontSize: 16,
              )),
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  (isTime==true)?Icon(Icons.access_time,color: Color(0xff6E5C52),):
                  (isTime==false)?Icon(Icons.calendar_month,color: Color(0xff6E5C52),):
                      SizedBox(),
                  SizedBox(width: 4,),
                  Expanded(
                    child: Text(description,style: TextStyle(
                      color: Color(0xff6E5C52),
                      fontSize: 14,
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
