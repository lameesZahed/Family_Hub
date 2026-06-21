import 'package:flutter/material.dart';

class EditAddCards extends StatelessWidget {
  final IconData icon;
  final String data;
  final VoidCallback onTap;

   EditAddCards({super.key, required this.icon, required this.data, required this.onTap,});

  bool expand=false;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          leading: DecoratedBox(
            decoration: BoxDecoration(
                color: Color(0xFFC96868).withOpacity(0.2),
                borderRadius: BorderRadius.circular(8)
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon,color: Color(0xFF6E5C52),size: 20,),
            ),
          ),
          title: Text(data),
          titleTextStyle:TextStyle(
              color: Color(0xFF0F172A),
              fontSize: 16
          ),
          onTap: onTap,
        ),
      ),
    );
  }

}







