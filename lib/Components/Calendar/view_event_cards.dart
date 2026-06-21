import 'package:flutter/material.dart';

class ViewCards extends StatelessWidget {
  final String type;
  final String text;
  final IconData? icon;
  const ViewCards({super.key, required this.type, required this.text, this.icon,});

  @override
  Widget build(BuildContext context) {
    bool showIcon = (icon==null)?false:true;
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Color(0xFFD0CECE),
          )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Text(type,style: TextStyle(
          color: Color(0xFF9B4747),
        fontSize: 16,
        fontWeight: FontWeight.normal
          )),
          SizedBox(height: 8,),
          Row(
            children: [
              showIcon?
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(icon,color:Color(0xFF6E5C52),size: 20,),
              )
                  :SizedBox(),
              Expanded(
                child: Text(text,style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6E5C52),
                  fontWeight: FontWeight.normal
                )),
              ),
            ],
          ),

        ],

      ),
    );
  }
}
