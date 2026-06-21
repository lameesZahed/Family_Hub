import 'package:flutter/material.dart';

import '../../Models/Gallery/photo.dart';
class PhotoDetailsUpper extends StatelessWidget {
  final Photo photo;
  const PhotoDetailsUpper({super.key, required this.photo, });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(photo.image_url,
              height: 400,
              fit: BoxFit.cover,
              width: double.infinity,
            )
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: BackButton(
            style: IconButton.styleFrom(
              backgroundColor: Colors.white.withOpacity(0.8),
            ),
          )

        ),
        Positioned(
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DrawerButton(
              onPressed: (){
                Scaffold.of(context).openEndDrawer();
              },
              style: IconButton.styleFrom(
                backgroundColor: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
