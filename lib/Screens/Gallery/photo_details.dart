import 'package:family_hub/Components/Customized%20Buttons/secondary_button.dart';
import 'package:family_hub/Components/Gallery/photo_details_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Components/Gallery/photo_details_upper.dart';
import '../../Components/Gallery/reaction_button.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Gallery/photo.dart';

class PhotoDetails extends StatelessWidget {
  final Photo photo;
  final int index;
  const PhotoDetails({super.key, required this.index, required this.photo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: photoDetailsBody(context),
      endDrawer: MainDrawer(),
    );
  }

  Widget photoDetailsBody(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PhotoDetailsUpper(photo: photo),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  MiddleBody(),
                  SizedBox(
                    height: 16,
                  ),
                  PhotoDetailsCard(
                    title: "DATE TAKEN",
                    data: DateFormat("MMMM d, yyyy").format(photo.date),
                  ),
                  PhotoDetailsCard(
                      title: "LOCATION",
                      data: photo.location
                  ),
                  PhotoDetailsCard(
                      title: "UPLOADED BY",
                      data: "Ahmed"
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: SecondaryButton(text: "Delete", onPressed: (){}),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget MiddleBody() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                "The image name",
                style: TextStyle(color: Color(0xff9B4747), fontSize: 20),
              ),
              Text(
                (index == 1)
                    ? "Best Moments"
                    : (index == 2)
                    ? "User Photos"
                    : "All Photos",
                style: TextStyle(color: Color(0xff6E5C52), fontSize: 16),
              ),
            ],
          ),
          Spacer(),
          ReactionButton(icon: Icons.favorite_border,onPressed: (){},),
          ReactionButton(icon: Icons.share,onPressed: (){},),
          ReactionButton(icon: Icons.download,onPressed: (){},),
        ],
      ),
    );
  }
}
