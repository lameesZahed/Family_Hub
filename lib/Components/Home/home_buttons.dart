import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeButtons extends StatelessWidget {
  final String sectionName;
  final String icon;
  const HomeButtons({super.key, required this.sectionName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style:ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        )
      ) ,
        onPressed: (){
          Navigator.pushNamed(context,sectionName);
        },
        child: Row(
          children: [
            SvgPicture.asset(icon,height: 24,width: 24,color: Color(0xff2F6F6C),),
            SizedBox(width: 8,),
            Text(sectionName,style: TextStyle(
              color: Color(0xFF9B4747),
              fontSize: 16,
              fontWeight: FontWeight.w600
            ),)
          ],
        )
    );
  }
}
