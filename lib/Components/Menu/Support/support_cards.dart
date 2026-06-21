import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Utils/url_helper_email.dart';
import '../../../Utils/url_helper_phone.dart';

class SupportCards extends StatelessWidget {
  final String info;
  final IconData icon;
  const SupportCards({super.key, required this.info, required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(icon == Icons.phone_in_talk){
          makePhoneCall(info);
        }
        else{
          sendEmail(info);
        }
      },
      child: Card(
        color: Color(0xFFFFF4EA),
        // elevation: 1,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(
            color: Color(0xFF308983)
          )
        ),
        // decoration: BoxDecoration(
        //   color: Colors.transparent,
        //   borderRadius: BorderRadius.circular(50),
        //   border: Border.all(
        //     color: Color(0xFF308983),
        //     // width: 2
        //   )
        //
        // ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon,color: Color(0xFF9B4747)),
              SizedBox(width: 16,),
              Text(info,style: TextStyle(color: Color(0xFF6E5C52))
              )
            ],
          ),
        ),

      ),
    );
  }
}
