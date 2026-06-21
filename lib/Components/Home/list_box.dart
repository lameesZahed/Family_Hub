import 'package:flutter/material.dart';

import '../../Screens/Lists/view_list.dart';
class ListBox extends StatelessWidget {
  final IconData icon;
  final String type;
  final Color iconColor;
  final Color cardColor;
  final Color bgIconColor;
  const ListBox({super.key, required this.icon, required this.type, required this.iconColor, required this.cardColor, required this.bgIconColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewList(title: type)));
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            fixedSize: Size(double.infinity, double.infinity),
            side: BorderSide(
                color: Color(0xFFD0CECE),
                width: 1,
                strokeAlign: BorderSide.strokeAlignInside
            )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: bgIconColor,
                    borderRadius: BorderRadius.circular(50)
                ),
                child:Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(icon,color: iconColor,size: 24,),
                ) ,
              ),
              SizedBox(width: 8,),
              SizedBox(
                width: 65,
                child: Text(type,style: TextStyle(
                    color: Color(0xFF6E5C52),
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                ),),
              ),

            ],
          ),
        )
    );
  }
}
