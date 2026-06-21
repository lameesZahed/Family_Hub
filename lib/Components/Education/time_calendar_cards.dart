import 'package:flutter/material.dart';

class TimeCalendarCards extends StatelessWidget {
  final String data;
  final IconData icon;
  final VoidCallback onTap;
  const TimeCalendarCards({super.key, required this.data, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFFC96868).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(icon, color: Color(0xff6E5C52)),
          ),
        ),
        title: Text(
          data,
          style: TextStyle(color: Color(0xff6E5C52), fontSize: 14),
        ),
        onTap: onTap,
      ),
    );
  }
}
