import 'package:family_hub/Components/Accounting/add_edit_tansaction_dialog.dart';
import 'package:family_hub/Components/Accounting/categories.dart';
import 'package:family_hub/Components/Accounting/category_type_cards.dart';
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Models/Accounting/categories_model.dart';
import 'package:flutter/material.dart';

import '../../Models/Accounting/all_categories_model.dart';

class AddEditCategoryDialog extends StatelessWidget {
  final String? type;
  final IconData? icon;
  AddEditCategoryDialog({super.key, this.type, this.icon});

  TextEditingController titleCategory = TextEditingController();
  TextEditingController balanceCategory = TextEditingController();
  FocusNode titleCategoryFocus = FocusNode();
  FocusNode balanceCategoryFocus = FocusNode();





  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    (type == null)? "Add Category":"Update Category",
                  style: TextStyle(
                    color: Color(0xFF9B4747),
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
                SizedBox(height: 16,),
                inputField(
                  title: "Name",
                  hint: "Enter Category Name",
                  controller: titleCategory,
                  focusNode: titleCategoryFocus,
                  nextFocusNode: balanceCategoryFocus,
                  keyboardType: TextInputType.text,
                  context: context,
                ),
                SizedBox(height: 16,),
                inputField(
                  title: "Balance",
                  hint: "0",
                  controller: balanceCategory,
                  focusNode: balanceCategoryFocus,
                  keyboardType: TextInputType.number,
                  context: context,
                ),
                SizedBox(height: 16,),
                Text(
                    "Category Icon",
                  style: TextStyle(
                    color: Color(0xFF6E5C52),
                    fontSize: 16,
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 16,),
                GridCategories(context),
                SizedBox(height: 32,),
                Button(text: (type == null)? "Add":"Update", onPressed: (){}),
                SizedBox(height: 24,),
              ],
            ),
          ),
        ),
      ),

    );
  }


  Widget inputField({
    required String hint,
    required TextEditingController controller,
    required String title,
    required FocusNode focusNode,
    FocusNode? nextFocusNode,
    required TextInputType keyboardType,
    required BuildContext context}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category $title",style: TextStyle(
          color: Color(0xFF6E5C52),
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),
        SizedBox(height: 16,),
        TextFormField(
          controller: controller,
         focusNode: focusNode,
         keyboardType: keyboardType,
         onFieldSubmitted: (value){
           if(nextFocusNode!=null && value.isNotEmpty){
             FocusScope.of(context).requestFocus(nextFocusNode);
           }
           else{
             focusNode.unfocus();
           }
         },
         decoration: InputDecoration(
           hintText: hint,
         )
        ),
      ],
    );
  }



  Widget GridCategories(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 8,
            childAspectRatio: 4,
          ),
          itemCount: AllCategoriesModel().otherCategories.length,
          itemBuilder: (context,index){
            return CategoryTypeCards(
                categoryIcon: AllCategoriesModel().otherCategories.values.elementAt(index)[0],
                categoryActive: AllCategoriesModel().otherCategories.values.elementAt(index)[1],
                categoryType: AllCategoriesModel().otherCategories.keys.elementAt(index)
            );
          }
      ),
    );
  }


}
