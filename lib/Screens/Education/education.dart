import 'package:family_hub/Components/Education/education_cards.dart';
import 'package:family_hub/Models/Education/education_category_model.dart';
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/App Cards/big_cards.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Components/Navigation/customized_navigation_bar.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Education"),
      endDrawer: MainDrawer(),
      body: educationBody(),
    );
  }


  Widget educationBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount:EducationCategoryModel().educationCategories.length ,
          itemBuilder: (context,index){
            var education = EducationCategoryModel().educationCategories[index];
            return BigCards(
                type:education.type ,
                icon:education.icon,
                image_url: education.image_url,
              alignment: Alignment.center,
              onTap: (){
                (education.categoryIndex==0)?Navigator.pushNamed(context, "Grades"):
                (education.categoryIndex==1)?Navigator.pushNamed(context, "Recommended"):
                (education.categoryIndex==2)?Navigator.pushNamed(context, "Tasks"):
                (education.categoryIndex==3)?Navigator.pushNamed(context, "Progress_Tracker"):
                null;
              }
            );
          }
      ),
    );
  }
}
