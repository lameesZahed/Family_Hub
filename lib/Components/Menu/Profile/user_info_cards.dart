import 'package:flutter/material.dart';
class UserInfoCards extends StatelessWidget {
  final String category;
  final String data;
  const UserInfoCards({super.key, required this.category, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(16)
          // ),
          tileColor: Colors.transparent,
          title: Text(category),
          titleTextStyle: TextStyle(
              color: Color(0xFF6E5C52),
              fontWeight: FontWeight.w500,
              fontSize: 12
          ),
          trailing: Text(data),
          leadingAndTrailingTextStyle: TextStyle(
              color: Color(0xFF016B61),
              fontWeight: FontWeight.w400,
              fontSize: 12
          ),

        ),
      ),
    );
  }
}
