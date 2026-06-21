import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalCards extends StatelessWidget {
  final String name;
  final String distanceLabel;

  const HospitalCards({super.key, required this.name, required this.distanceLabel});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        tileColor: Colors.white,
        title: Text(name),
        titleTextStyle: const TextStyle(
          color: Color(0xFF9B4747),
          fontSize: 16,
          fontWeight: FontWeight.normal,
        ),
        subtitle: Text(distanceLabel),
        subtitleTextStyle: TextStyle(
          color: const Color(0xFF6E5C52).withOpacity(0.5),
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        leading: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: const Color(0xff308983).withOpacity(0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset("assets/Icons/Hospital.svg", color: const Color(0xff308983)),
          ),
        ),
      ),
    );
  }
}