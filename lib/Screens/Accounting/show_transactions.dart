import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Models/Accounting/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Components/Accounting/add_edit_tansaction_dialog.dart';
import '../../Components/Accounting/transactions_cards.dart';
import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Accounting/transactions_model.dart';

class ShowTransactions extends StatelessWidget {
  final String title;
  const ShowTransactions({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: title),
      endDrawer: MainDrawer(),
      floatingActionButton: AddButton(
        onPressed: () {
          showDialog(context: context, builder: (context)=>AddEditTansactionDialog());
        },
      ),
      body: showTransactionsBody(),

    );
  }


  Widget showTransactionsBody(){
    List<TransactionsModel> transactions = CategoriesModel().categories[title]!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Recent Activities",style: TextStyle(
            color: Color(0xFF9B4747),
            fontSize: 14,
            fontWeight: FontWeight.w500
          )),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: CategoriesModel().categories[title]!.length,
            itemBuilder: (context,index){
              return TransactionsCards(
                title: transactions[index].name,
                amount: transactions[index].amount,
                dateTime: transactions[index].dateTime,
                duration: transactions[index].duration,
              );
            }
        )
      ],
    );
  }

}
