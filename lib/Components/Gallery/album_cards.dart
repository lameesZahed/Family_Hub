import 'package:family_hub/Screens/Gallery/show_photos.dart';
import 'package:flutter/material.dart';

import '../../Models/Gallery/photo.dart';


class AlbumCards extends StatelessWidget {
  final List<Photo> images;
  final int index; //1=best moments,2=user photos,3=all photos
   AlbumCards({super.key, required this.images, required this.index});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowPhotos(index: index, images: images)));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(images.last.image_url,fit: BoxFit.cover,height: 150,width: double.infinity,)
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text((index==1)?"Best Moments"
                      :(index==2)?"User Photos"
                      :"All Photos",style: TextStyle(
                    color: Color(0xff6E5C52),
                    fontSize: 14,
                  )),
                  Text("${images.length} Photos",style: TextStyle(
                    color: Color(0xffC4B7A6),
                    fontSize: 14,
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
