import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class Sections extends StatelessWidget {
  final String section;
  final String icon;
  final Widget child;
  const Sections({super.key, required this.section, required this.icon, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(icon, color: Color(0xFF308983),height: 32,width: 32,),
            SizedBox(width: 8),
            Text(section, style: TextStyle(
                color: Color(0xFF9B4747),
                fontSize: 20,
                fontWeight: FontWeight.normal
            )),
            Spacer(),
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context,section);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xFF9B4747)
                ),
                child: Row(
                  children: [
                    Text("See All", style: TextStyle()),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward_ios, size: 16,)
                  ],
                )
            )
          ],
        ),
        SizedBox(height: 16,),
        child
      ],
    );
  }
}
