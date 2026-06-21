import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';

class Article extends StatefulWidget {
  final String image;
  final String description;
   bool saved;
   Article({super.key, required this.image, required this.description, required this.saved});

  @override
  State<Article> createState() => _ArticleState();
}

class _ArticleState extends State<Article> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(),
      appBar: MainAppBar(title: 'Article 1'),
      body: Body(),

    );
  }

  Widget Body(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(widget.image,
              width: 350,
            ),
          ),

        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    widget.saved = !widget.saved;
                  });
                },
                icon: (widget.saved)?Icon(Icons.bookmark, color: Color(0xFF9B4747),size: 32,):Icon(Icons.bookmark_border, color: Color(0xFF9B4747),size: 32,),
              )
            ),
          ],
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Description",style: TextStyle(
                  color: Color(0xFF9B4747),
                  fontSize: 16,
                  fontWeight: FontWeight.w500
              ),

              ),
              SizedBox(
                width: 350,
                // height: 100,
                child: Text(widget.description,
                  style: TextStyle(
                      color: Color(0xFF6E5C52).withOpacity(0.5),
                      fontSize: 12
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  textAlign: TextAlign.left,
                ),

              ),
            ],
          ),
        )

      ],
    );
  }
}


