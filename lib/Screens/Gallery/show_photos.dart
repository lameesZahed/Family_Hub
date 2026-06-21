import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Models/Gallery/photo.dart';
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Gallery/add_photo_pop_up.dart';
import '../../Components/Gallery/photos_list.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class ShowPhotos extends StatelessWidget {
  final int index;
  final List<Photo> images;
  const ShowPhotos({super.key, required this.index, required this.images});

  @override
  Widget build(BuildContext context) {
    String title = (index==1)?"Best Moments"
        :(index==2)?"User Photos"
        :"All Photos";
    return Scaffold(
      appBar: MainAppBar(title: title),
      endDrawer: MainDrawer(),
      body: showPhotos(),
      floatingActionButton: AddButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddPhotoPopUp();
            }
          );
        },
      ),
    );
  }


  Widget showPhotos(){
    return SingleChildScrollView(
        child: PhotosList(
          images: images,
          indextitle: index,
        )
    );
  }
}
