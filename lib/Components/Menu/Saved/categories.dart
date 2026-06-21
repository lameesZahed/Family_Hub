import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final Widget icon;
  final String title;
  final int items;
  final Function onTap;
  const Categories({super.key, required this.icon, required this.title, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:8),
      child: Column(
        children: [
          ListTile(
            leading: Container(
                height: 42,
                width: 42,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(50),
                  color: Color(0xFF016B61),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: icon,
                )
            ),
            title: Text("Saved $title"),
            titleTextStyle: TextStyle(
              color: Color(0xFF6E5C52),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
            onTap: ()=>onTap(),
            subtitle: Text("$items items"),
            subtitleTextStyle: TextStyle(
              color: Color(0xFFC4B7A6),
              // fontWeight: FontWeight.w400,
              fontSize: 12,
            ),
            trailing: IconButton(
                onPressed: ()=>onTap(),
                icon: Icon(Icons.arrow_forward_ios,color: Color(0xFF35383F),)
            ),
            // shape: Border(
            //     bottom: BorderSide(
            //       color: Color(0xFF6E5C52),
            //       width: 1,
            //     )
            // ),
          ),
          Divider(
          indent: 16, endIndent: 16 , color: Color(0xFF6E5C52).withOpacity(0.5),
          )
        ],
      ),
    );
  }
}
