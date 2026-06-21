import 'package:family_hub/Components/Accounting/income_expense_toggle.dart';
import 'package:flutter/material.dart';

import '../Customized Buttons/button.dart';

class AddEditTansactionDialog extends StatelessWidget {
  final String? type;
  AddEditTansactionDialog ({super.key, this.type});


  TextEditingController titleTransaction = TextEditingController();
  TextEditingController balanceTransaction = TextEditingController();
  TextEditingController detailsTransaction = TextEditingController();
  FocusNode titleTransactionFocus = FocusNode();
  FocusNode balanceTransactionFocus = FocusNode();
  FocusNode detailsTransactionFocus = FocusNode();



  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Form(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
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
                  hint: "Enter Transaction Name",
                  controller: titleTransaction,
                  focusNode: titleTransactionFocus,
                  nextFocusNode: detailsTransactionFocus,
                  keyboardType: TextInputType.text,
                  context: context,
                ),
                SizedBox(height: 16,),
                inputField(
                  title: "Details",
                  hint: "Enter Transaction Details",
                  controller: detailsTransaction,
                  focusNode: detailsTransactionFocus,
                  keyboardType: TextInputType.text,
                  context: context,
                ),
                SizedBox(height: 24,),
                IncomeExpenseToggle(),
                SizedBox(height: 16,),
                inputField(
                  title: "Balance",
                  hint: "0",
                  controller: balanceTransaction,
                  focusNode: balanceTransactionFocus,
                  keyboardType: TextInputType.number,
                  context: context,
                ),
                SizedBox(height: 32,),
                Button(text: (type == null)? "Add":"Update", onPressed: (){}),

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
        Text("Transaction $title",style: TextStyle(
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




}
