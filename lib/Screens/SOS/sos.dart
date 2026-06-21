import 'package:family_hub/Components/App%20Bar/main_app_bar.dart';
import 'package:family_hub/Components/SOS/sos_cards_minor.dart';
import 'package:family_hub/Models/SOS/sos_model.dart';
import 'package:flutter/material.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Components/SOS/sos_cards_basic.dart';

class Sos extends StatelessWidget {
  const Sos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer: MainDrawer(),
        appBar: MainAppBar(title: 'SOS'),
      body: BodySOS(),
    );
  }
}

Widget BodySOS(){
  return SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          theList(SosModel().Emergency_List),
          Text("Utility Emergencies",style: TextStyle(
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.bold,
            fontSize: 12
          )),
          theList(SosModel().Utility_Emergencies),
          Text("Road & Transport",style: TextStyle(
              color: Color(0xFF94A3B8),
              fontWeight: FontWeight.bold,
              fontSize: 12
          )),
          theList(SosModel().Road_Transport),
          Text("Social & Government",style: TextStyle(
              color: Color(0xFF94A3B8),
              fontWeight: FontWeight.bold,
              fontSize: 12
          )),
          theList(SosModel().Social_Government),
        ],
      ),
    ),
  );
}

Widget theList(Map Emergency){
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: Emergency.length ,
        itemBuilder: (context,index){
          List EmergencyList = Emergency.values.elementAt(index);
          if(EmergencyList.length>3){
            return SosCardsBasic(
              icon: EmergencyList[0],
              title: Emergency.keys.elementAt(index),
              number: EmergencyList.last,
              description:EmergencyList[1] ,
              color: EmergencyList[2],
            );
          }
          else{
            return SosCardsMinor(
                icon: EmergencyList[0],
                title: Emergency.keys.elementAt(index),
                number: EmergencyList.last,
                color: EmergencyList[1],
            );
          }
        }
    );


}





