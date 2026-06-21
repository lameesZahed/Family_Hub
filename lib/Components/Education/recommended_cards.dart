import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RecommendedCards extends StatelessWidget {
  final String title;
  final String subtitle;
  const RecommendedCards({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
          ListTile(
          title: Text(title),
          subtitle: SizedBox(
              child: Text(
                subtitle,
                // overflow: TextOverflow.ellipsis,
              )),
          titleTextStyle:TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff9B4747)
          ),
          subtitleTextStyle: TextStyle(
              fontSize: 12,
              color: Color(0xff6E5C52)
          ),
          trailing: SvgPicture.asset("assets/Icons/Education/Recommended_courses.svg",height: 40,),
        ))
      ),
    );
  }
}
