import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Models/Accounting/categories_model.dart';
import 'package:flutter/material.dart';
import '../../Components/Accounting/Spent_chart.dart';
import '../../Components/Accounting/category_usage_cards.dart';
import '../../Components/Accounting/time_range_buttons.dart';
import '../../Components/Accounting/weeks_range_box.dart';
import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Accounting/all_categories_model.dart';

class SpentDetails extends StatelessWidget {
  const SpentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Spent Details"),
      endDrawer: MainDrawer(),
      body: spentDetailsBody(),

    );
  }
}

Widget spentDetailsBody() {
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TimeRangeButtons(),
          SizedBox(height: 16,),
          SpentChart(),
          SizedBox(height: 16,),
          categoriesSection(),
        ],
      ),
    ),
  );
}

Widget categoriesSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "Categories",
          style: TextStyle(color: Color(0xFF9B4747), fontSize: 20),
        ),
      ),
      SizedBox(height: 8,),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: AllCategoriesModel().basicCategories.length,
        itemBuilder: (context, index) {
          int transactions = CategoriesModel()
              .categories[AllCategoriesModel().basicCategories.keys
                  .toList()[index]]!
              .length;
          List<Color> colors = [
            Color(0xFF016B61),
            Color(0xFF823B18),
            Color(0xFF6E5C52),
          ];
          return CategoryUsageCards(
            title: AllCategoriesModel().basicCategories.keys.toList()[index],
            icon: AllCategoriesModel().basicCategories.values.toList()[index],
            amount: 100,
            subtitle: "$transactions transactions",
            color: colors[index % 3],
          );
        },
      ),
    ],
  );
}
