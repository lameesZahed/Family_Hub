import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Utils/url_helper_phone.dart';

class SosCardsMinor extends StatelessWidget {
  final String icon;
  final String title;
  final String number;
  final String color;
  const SosCardsMinor({super.key, required this.icon, required this.title, required this.number, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: Color(0xFFE2E8F0),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Container(
            width: 40,
              decoration: BoxDecoration(
                  color: Color(int.parse(color)).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)
                  // shape: BoxShape.circle
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(icon,),
              )
          ),
          title: Text(title,style: TextStyle(
            color: Color(0xFF334155),
            fontWeight: FontWeight.w500,
            fontSize: 16
          ),),
          trailing: Text(number,style: TextStyle(
              color: Color(0xFF0F172A),
            fontSize: 14
          )),
          onTap: ()=> makePhoneCall(number),

        ),
      ),
    );
  }
}
