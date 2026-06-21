import 'package:family_hub/Components/Gallery/album_cards.dart';
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Gallery/gallery_model.dart';
import '../../Models/Gallery/photo.dart';

class Gallery extends StatelessWidget {
  const Gallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MainAppBar(title: "Gallery"),
      endDrawer: MainDrawer(),
        body: GalleryBody(),
        // body: DocumentsBody(),

    );
  }

  Widget GalleryBody(){
    List<Photo> images = GalleryModel().all_photos.values.expand((element) => element).toList();
    return Column(
      children: [
        AlbumCards(images:images , index: 3),
        Row(
          children: [
            Expanded(child: AlbumCards(images: GalleryModel().all_photos["Best Moments"]!,index: 1)),
            Expanded(child: AlbumCards(images: GalleryModel().all_photos["User Photos"]!,index: 2)),
            // AlbumCards(images: GalleryModel().all_photos["All Photos"]!,index: 3),
          ]
        )
      ]
    );
  }
}
