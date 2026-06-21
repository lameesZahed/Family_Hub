import 'package:flutter/material.dart';

class FamilyManagementCards extends StatelessWidget {
  final String title;
  final IconData icon;
  const FamilyManagementCards({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: ListTile(
          onTap: (){
            Navigator.pushNamed(context, title);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: Icon(icon,color: Color(0xff308983),),
          trailing: Icon(Icons.arrow_forward_ios_rounded,color: Color(0xff9B4747)),
          title: Text(title),
          titleTextStyle: TextStyle(
            color: Color(0xff9B4747),
            fontSize: 14,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
