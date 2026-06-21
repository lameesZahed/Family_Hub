import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Components/Lists/main_cards.dart';
import 'package:family_hub/Components/Lists/shopping_todo_cards.dart';
import 'package:family_hub/Models/Lists/lists_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Lists/edit_add_dialog_box.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Lists/shooping_list_model.dart';
import '../../Models/Lists/todo_list_model.dart';

class Lists extends StatelessWidget {
  const Lists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Lists"),
      endDrawer: MainDrawer(),
      floatingActionButton: AddButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context)=>EditAddDialogBox(
                type: 'List',
              )
          );
        },
      ),
      body: Body(),
    );
  }

  Widget Body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ShoppingTodoCards(
                  icon: Icons.shopping_bag_outlined,
                  type: "Shopping",
                  items_quantity: ShoppingListModel().ShoppingList.length,
                  icon_color: Color(0xFFB05B4B),
                  card_color: Color(0xFFFFF0DD), 
                  bg_icon_color: Color(0xFFFFF7ED),
      
                ),
              ),
              Expanded(
                child: ShoppingTodoCards(
                  icon: Icons.assignment_outlined,
                  type: "To Do's",
                  items_quantity: TodoListModel().TodoList.length,
                  icon_color: Color(0xFF9AB3A8),
                  card_color: Color(0xFFD6FFF5),
                  bg_icon_color: Color(0xFFF0FDFA),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          otherLists()
        ],
      ),
    );
  }

  Widget otherLists() {
    return ListView.builder(
      itemCount: ListModel().Lists.length,
        shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
        child: MainCards(
            image: ListModel().Lists.values.elementAt(index)[1],
            title: ListModel().Lists.keys.elementAt(index),
            quantity: ListModel().Lists.values.elementAt(index)[2].length,
            position: index,

        ),
      );
    });
  }
}
