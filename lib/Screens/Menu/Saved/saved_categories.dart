import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Components/Menu/Saved/categories.dart';
import '../../../Models/Medication/hospitals_model.dart';

class SavedCategories extends StatelessWidget {
  const SavedCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Saved"),
      drawer: MainDrawer(),
      // body: SavedBody(context),
    );
  }

  // Widget SavedBody(BuildContext context){
  //   return Column(
  //     children: [
  //       Categories(
  //         icon:  SvgPicture.asset("assets/Icons/Chef.svg",height: 24,width: 24),
  //         title:  "Meals",
  //         items:  MealsModel().meals.length,
  //         onTap: (){
  //           Navigator.pushNamed(context, "Saved Meals");
  //         },
  //       ),
  //       Categories(
  //         icon:  Icon(Icons.menu,color: Colors.white,),
  //         title:  "Articles",
  //         items:    ArticlesModel.articles.length,
  //         onTap: (){
  //           // Navigator.push(context, MaterialPageRoute(builder: (context)=>SavedArticles()));
  //           Navigator.pushNamed(context, "Saved Articles");
  //         },
  //       )
  //     ],
  //   );
  // }




}
