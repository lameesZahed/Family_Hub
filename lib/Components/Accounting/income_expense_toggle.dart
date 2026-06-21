import 'package:family_hub/Components/Accounting/add_edit_tansaction_dialog.dart';
import 'package:flutter/material.dart';
class IncomeExpenseToggle extends StatefulWidget {
  IncomeExpenseToggle({super.key});

  FocusNode incomeFocus = FocusNode();
  FocusNode expenseFocus = FocusNode();
  @override
  State<IncomeExpenseToggle> createState() => _IncomeExpenseToggleState();
}

class _IncomeExpenseToggleState extends State<IncomeExpenseToggle> {


  int selectedIndex = 0;
  bool income = true;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
      return ToggleButtons(
        constraints: BoxConstraints(
          minHeight: 44,
          minWidth: constraints.maxWidth/2 -8,
        ),
          focusNodes: [widget.incomeFocus,widget.expenseFocus],
          isSelected: [income,!income],
          onPressed: (value){
            setState(() {
              income = value == 0;
              //لوالفاليو بتساوي زيرو كدا الانكم ترو لو الفاليو بواحد كدا الانكم بفولس
            });
          },
      children: [
      Text("Income"),
      Text("Expense")
      ]);},
    );
  }
}
