import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Utils/url_helper_phone.dart';

class SosCardsBasic extends StatelessWidget {
  final String icon;
  final String title;
  final String description;
  final String number;
  final String color;
  const SosCardsBasic({super.key, required this.icon,required this.description, required this.title, required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: Color(int.parse(color)).withOpacity(0.2),
            width: 2
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(
              decoration: BoxDecoration(
                color: Color(int.parse(color)).withOpacity(0.1),
                shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(icon,),
              )
          ),
          title: Text(title,style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),),
          trailing: Text(number,style: TextStyle(
            color: Color(int.parse(color)),
            fontWeight: FontWeight.bold,
            fontSize: 20
          )),
          subtitle: Text(description,style: TextStyle(
              color: Color(0xFF64748B),
            fontSize: 14
        )),
          onTap: ()=> makePhoneCall(number),
        ),
      ),
    );
  }
}
