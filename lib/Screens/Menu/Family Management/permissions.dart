import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Components/Menu/Family%20Management/family_menu.dart';
import 'package:family_hub/Models/Family%20Tree/family_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';
import '../../../Models/Family Tree/family.dart';

class Permissions extends StatefulWidget {
   Permissions({super.key});

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {

  TextEditingController memberController = TextEditingController();
  Map <String,bool> appSections = {
    "Calendar":true,
    "Location":true,
    "Education":true,
    "Medication":true,
    "Messaging":true,
    "List":true,
    "Kitchen":true,
    "Accounting":true,
    "My Family":true,
    "Documents":true,
    "Gallery":true,
    "SOS":true
  };


  @override
@override


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Permissions"),
      endDrawer: MainDrawer(),
      body: permissionsBody(),
    );
  }

  Widget permissionsBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            upperBody(),
            SizedBox(height: 24,),
            lowerBody(),
            SizedBox(height: 16,),
            Button(text: "Save", onPressed: (){}),
            SizedBox(height: 48,),

          ],
        ),
      ),
    );
  }

  TextStyle textStyle= TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Color(0xff9B4747)
  );

  Widget upperBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        block(
           title:  "Select Member",
           child: FamilyMenu(controller: memberController)
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





  Widget lowerBody(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        block(
            title:  "Permissions",
            child: ListView.builder(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: appSections.length,
                itemBuilder: (context,index){
                 bool isCheck =appSections.values.elementAt(index);
                 String section =appSections.keys.elementAt(index);
                   return Padding(
                     padding: const EdgeInsets.only(bottom: 8.0),
                     child: SwitchListTile(
                       tileColor: Colors.white,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(16)
                         ),
                         title: Text(appSections.keys.elementAt(index),style: TextStyle(
                           fontWeight: FontWeight.w600,
                           fontSize: 14,
                           color: Color(0xff9B4747)
                         ),),
                         value: isCheck,
                         onChanged: (value){
                           setState(() {
                             appSections[section] = value;
                           });
                         }
                     ),
                   );
                }
            )
        )
      ],
    );
  }
}
