import 'package:flutter/material.dart';

class PhotoDetailsCard extends StatelessWidget {
  final String title;
  final String data;
  const PhotoDetailsCard({super.key, required this.title, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,style: TextStyle(
                color: Color(0xff6E5C52),
                fontSize: 12
              )
              ),
              SizedBox(height: 4,),
              Text(data,style: TextStyle(
                color: Color(0xff292D32),
                fontSize: 18
              ))
            ],
          ),
        ),
      ),
    );
  }
}
