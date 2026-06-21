import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Components/App Bar/main_app_bar.dart';
import '../../../Components/Menu/Drawer/main_drawer.dart';

class Information extends StatefulWidget {
   Information({super.key});

  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  late bool enabledName;
  late bool enabledID;
  TextEditingController familyName = TextEditingController();
  FocusNode familyNameFocus = FocusNode();
  TextEditingController familyID = TextEditingController();


  @override
  void initState() {
    super.initState();
    familyName.text = "Zahed";
    familyID.text= "1234";
    enabledName = false;
    enabledID = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: "Information",
      ),
      endDrawer: MainDrawer(),
      body: informationBody(),
    );
  }

  TextStyle titlesStyle = TextStyle(
    fontSize: 20,
    color: Color(0xFF9B4747),
    fontWeight: FontWeight.normal,
  );

  Widget firstPart({required String title,required IconData icon,required VoidCallback onPressed,required bool enabled}){
    return Row(
      children: [
        Text(title,style: titlesStyle,),
        Spacer(),
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              (enabled)?Icons.check_circle:icon,
              color: Color(0xff308983),
            )
        )
      ],
    );
  }



  Widget secondPart({required TextEditingController controller,required bool enabled,FocusNode? focusNode}){
    return TextFormField(
      focusNode: focusNode,
      controller: controller,
      style: TextStyle(color: Colors.black),
      decoration: InputDecoration(
        enabled: enabled,
      ),
    );
  }



  Widget informationBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              firstPart(
                 title:  "Family name ",
                 icon:  Icons.edit_outlined,
                 enabled: enabledName,
                 onPressed: (){
                   setState(() {
                     enabledName = !enabledName;
                     WidgetsBinding.instance.addPostFrameCallback((_) {
                       familyNameFocus.requestFocus();
                     });
                   });
                 }
              ),
              SizedBox(height: 16,),
              secondPart(controller: familyName, enabled: enabledName,focusNode: familyNameFocus),
              SizedBox(height: 24,),
              firstPart(
                 title:  "Family ID ",
                 icon:  Icons.copy_rounded,
                 enabled: enabledID,
                 onPressed: () async {
                   await Clipboard.setData(ClipboardData(text: familyID.text));
                 }
              ),
              SizedBox(height: 16,),
              secondPart(controller: familyID, enabled: enabledID)
            ],
          ),
        ),
      ),
    );
  }
}
