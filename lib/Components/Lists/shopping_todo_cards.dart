import 'package:flutter/material.dart';

import '../../Screens/Lists/view_list.dart';

class ShoppingTodoCards extends StatelessWidget {
  final IconData icon;
  final String type;
  final int items_quantity;
  final Color icon_color;
  final Color card_color;
  final Color bg_icon_color;
  const ShoppingTodoCards({super.key, required this.icon, required this.type, required this.items_quantity, required this.icon_color, required this.card_color, required this.bg_icon_color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewList(title: type)));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: card_color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: BorderSide(
              color: Color(0xFFD0CECE),
              width: 1,
              strokeAlign: BorderSide.strokeAlignInside
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0,horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: bg_icon_color,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(icon,color: icon_color,size: 32,),
                  ) ,
                ),
                SizedBox(height: 16,),
                Text(type,style: TextStyle(
                  color: Color(0xFF6E5C52),
                  fontSize: 16,
                  fontWeight: FontWeight.bold
                ),),
                SizedBox(height: 8,),
                Text("$items_quantity items",style: TextStyle(
                  color: Color(0xFF6E5C52).withOpacity(0.5),
                  fontSize: 12
                ),)
              ],
            ),
          )
      ),
    );
  }
}
