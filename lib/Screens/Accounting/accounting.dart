import 'package:family_hub/Components/Accounting/categories.dart';
import 'package:family_hub/Models/Accounting/all_categories_model.dart';
import 'package:flutter/material.dart';

import '../../Components/Accounting/add_edit_category_dialog.dart';
import '../../Components/Accounting/mybalance_spent.dart';
import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Customized Buttons/add_button.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class Accounting extends StatelessWidget {
  const Accounting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Accounting"),
      endDrawer: MainDrawer(),
      floatingActionButton: AddButton(onPressed: (){
        showDialog(context: context, builder: (context)=>AddEditCategoryDialog());
      }),
      body: accountingBody(),
    );
  }

Widget accountingBody(){

    int balance = 1000;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            MybalanceSpent(type: 'My balance',balance: balance,),
            SizedBox(height: 24,),
            MybalanceSpent(type: 'Spent',balance: balance),
            SizedBox(height: 24,),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(16)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF70B2B2),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Category",textAlign: TextAlign.center,style: TextStyle(
                          color: Colors.white,
                          // fontSize: 14
                        ),),
                      ),
                    ),
                    SizedBox(height: 16,),
                    CategorySection(),
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
}

Widget CategorySection(){
  List categoryIcon = AllCategoriesModel().basicCategories.values.toList();
  List categoryName = AllCategoriesModel().basicCategories.keys.toList();
  List<Widget> categoryCards = [];
  for(int i=0;i<AllCategoriesModel().basicCategories.length;i++){
    categoryCards.add(Categories(icon: categoryIcon[i], title: categoryName[i]));
  }
    return Column(
      children: categoryCards,
    );
}

}
