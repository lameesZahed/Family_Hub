import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Components/Lists/minor_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Lists/edit_add_dialog_box.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Models/Lists/lists_model.dart';
import '../../Models/Lists/shooping_list_model.dart';
import '../../Models/Lists/todo_list_model.dart';


class ViewList extends StatelessWidget {
   String title;
   ViewList({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: MainDrawer(),
      appBar: MainAppBar(title: title),
      floatingActionButton: AddButton(
          onPressed: (){
        showDialog(
            context: context,
            builder: (context)=>EditAddDialogBox(
              type: (title == "To Do's")?"Task":"Item",
            )
        );

      }),
      body: TaskList(),
    );
  }


  Widget TaskList(){
    List shopping = ShoppingListModel().ShoppingList;
    List todo = TodoListModel().TodoList;
    Map lists = ListModel().Lists;
    if(title =="Shopping"){
      return ListView.builder(
          itemCount: shopping.length,
          itemBuilder: (context,index){
            return MinorCards(
                image: shopping[index][2],
                title: shopping[index][0],
                description: shopping[index][1],
                isChecked: shopping[index][3]
            );

          }
      );
    }
    else if(title =="To Do's"){
      return ListView.builder(
          itemCount: todo.length,
          itemBuilder: (context,index){
            return MinorCards(
                image: todo[index][2],
                title: todo[index][0],
                description: todo[index][1],
                isChecked: todo[index][3]
            );
          }
      );

    }
    else{
      return ListView.builder(
          itemCount: lists[title]![2].length,
          itemBuilder: (context,index){
            return MinorCards(
                image: lists[title]![2][index][2],
                title: lists[title]![2][index][0],
                description: lists[title]![2][index][1],
                isChecked: lists[title]![2][index][3]
            );

          }
      );
    }


  }
}

