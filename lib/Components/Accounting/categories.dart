import 'package:family_hub/Components/Accounting/add_edit_tansaction_dialog.dart';
import 'package:flutter/material.dart';

import '../../Models/Accounting/categories_model.dart';

class Categories extends StatelessWidget {
  final IconData icon;
  final String title;
  Categories({super.key, required this.icon, required this.title});


  @override
  Widget build(BuildContext context) {
    int addedBalance =0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: DecoratedBox(
          decoration: BoxDecoration(
            color: Color(0xFF016B61),
            borderRadius: BorderRadius.circular(50)
          ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon,color: Colors.white,size: 24,),
            )
        ),
        title: Text(title) ,
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${CategoriesModel().categories[title]?.length} transactions"),
            Text("$addedBalance / ${CategoriesModel().sum(title)} \$")
          ],
        ),
        trailing: IconButton(
          constraints: BoxConstraints(
            maxHeight: 32,
            maxWidth: 32,
          ),
          style: IconButton.styleFrom(
            backgroundColor: Color(0xFFC4B7A6),
          ),
            onPressed: (){
            showDialog(context: context, builder: (context)=>AddEditTansactionDialog());
            },
            icon: Icon(Icons.add,color: Colors.white,size: 12,)
        ),
        subtitleTextStyle: TextStyle(
          color: Color(0xFFC4B7A6),
          fontWeight: FontWeight.w500,
          fontSize: 12
        ),
        titleTextStyle: TextStyle(
          color: Color(0xFF9B4747),
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}
