import 'package:family_hub/Screens/Gallery/photo_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../Models/Gallery/photo.dart';

class PhotosList extends StatelessWidget {
  final int indextitle;
  final List<Photo> images;
  PhotosList({super.key, required this.indextitle, required this.images});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
        child:GridView.custom(
            shrinkWrap: true,
            semanticChildCount: images.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              repeatPattern: QuiltedGridRepeatPattern.same,
              pattern: [
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(2, 1),
                QuiltedGridTile(1, 1),
                // QuiltedGridTile(1, 1),
                // QuiltedGridTile(1, 1),

              ]
            ),
            childrenDelegate: SliverChildBuilderDelegate(
                (context,index){
                  return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoDetails(
                          photo: images[index],
                          index: indextitle,)));
                      },
                      child: Image.asset(images[index].image_url,height: 400,fit: BoxFit.cover,)
                  );
                },
              childCount: images.length,
            )
            )
        ) ,
      );

  }
}

// StaggeredGrid.extent(
// maxCrossAxisExtent: 150,
// crossAxisSpacing: 8,
// mainAxisSpacing: 8,
// children: children,
// )