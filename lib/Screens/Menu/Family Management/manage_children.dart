import 'package:family_hub/Components/Menu/Family%20Management/connection_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Customized Buttons/button.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Components/Menu/Family Management/family_menu.dart';
import '../../../Models/Family Tree/family.dart';
import '../../../Models/Family Tree/family_model.dart';

class ManageChildren extends StatelessWidget {
   ManageChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Manage Children"),
      endDrawer: MainDrawer(),
      body: manageChildrenBody() ,
    );
  }

  TextEditingController parentController = TextEditingController();
  TextEditingController childController = TextEditingController();

  TextStyle textStyle= TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.normal,
      color: Color(0xff9B4747)
  );

  Widget manageChildrenBody(){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            firstPart(),
            SizedBox(height: 24,),
            secondPart()


          ],
        ),
      ),
    );
  }


  Widget firstPart(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Connect children",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Color(0xff9B4747)
        ),),
        SizedBox(height: 16,),
        block(title: "Select parent", child: FamilyMenu(controller: parentController)),
        SizedBox(height: 16,),
        block(title: "Select child", child: FamilyMenu(controller: childController)),
        SizedBox(height: 16,),
        Button(text: "Add", onPressed: (){}),
      ],
    );
  }


  Widget secondPart(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Connections",style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Color(0xff9B4747)
        ),),
        SizedBox(height: 16,),
        ConnectionCards(
          firstMemberName:"Zahed" ,
          firstRelationship: Family.Father ,
          secondMemberName: "Lamees" ,
          secondRelationship: Family.Daughter,
        )
      ],
    );
  }








   Widget block({required String title,required Widget child}){
     return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(title,style: textStyle,),
         SizedBox(height: 16,),
         child
       ],
     );
   }



}
