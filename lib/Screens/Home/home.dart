import 'package:family_hub/Components/Customized%20Buttons/custome_floating_button.dart';
import 'package:family_hub/Components/Home/ads_slider.dart';
import 'package:family_hub/Components/Home/home_buttons.dart';
import 'package:family_hub/Components/Home/list_box.dart';
import 'package:family_hub/Components/Home/medication_box.dart';
import 'package:family_hub/Components/Home/sections.dart';
import 'package:flutter/material.dart';

import '../../Components/Accounting/mybalance_spent.dart';
import '../../Components/App Bar/main_app_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CustomeFloatingButton(
          onPressed: (){Navigator.pushNamed(context, "SOS");},
          icon: Icons.sos
      ),
      body: homeBody(context),
    );
  }


  Widget homeBody(BuildContext context){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdsSlider(),
            SizedBox(height: 24),
            Sections(
                section: "Medication",
                icon:"assets/Icons/Home/medication.svg" ,
                child: medicationPart(context)
            ),
            SizedBox(height: 24),
            Sections(
                section: "Lists",
                icon:"assets/Icons/Home/list.svg" ,
                child: listsPart()
            ),
            SizedBox(height: 24),
            Sections(
                section: "Accounting",
                icon:"assets/Icons/Home/account_balance.svg" ,
                child: MybalanceSpent(type: 'Spent',balance: 10),
            ),
            SizedBox(height: 24),
            Text("More actions",style: TextStyle(
                color: Color(0xFF9B4747),
                fontSize: 20,
                fontWeight: FontWeight.normal
            ),),
            SizedBox(height: 16,),
            moreActions(),
            SizedBox(height: 24),



          ],
        ),
      ),
    );
  }

  Widget medicationPart(BuildContext context){
    return Column(
      children: [
        MedicationBox(
            imageUrl: 'assets/Images/Medication/Doctors.jpg',
            icon: "assets/Icons/Doctor.svg",
            type: 'Nearby doctors',
            onTap: (){
              Navigator.pushNamed(context, "NearbyDoctors");
            }
        ),
        MedicationBox(
            imageUrl: 'assets/Images/Medication/Hospital.jpg',
            icon: "assets/Icons/Hospital.svg",
            type: 'Nearby Hospitals',
            onTap: (){
              Navigator.pushNamed(context, "Hospitals");
            }
        ),
      ],
    );
  }

  Widget listsPart(){
    return Row(
      children: [
        Expanded(
          child: ListBox(
            icon: Icons.shopping_bag_outlined,
            type: "Shopping",
            iconColor: Color(0xFFB05B4B),
            cardColor: Color(0xFFFFF0DD),
            bgIconColor: Color(0xFFFFF7ED),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: ListBox(
            icon: Icons.assignment_outlined,
            type: "To Do's",
            iconColor: Color(0xFF9AB3A8),
            cardColor: Color(0xFFD6FFF5),
            bgIconColor: Color(0xFFF0FDFA),
          ),
        )
      ],
    );
  }

  Widget moreActions(){
    Map <String,String> actions ={
      "Documents":"assets/Icons/Home/docs.svg",
      "Gallery":"assets/Icons/Home/gallery.svg",
      "Kitchen":"assets/Icons/Home/kitchen.svg",
      "Education":"assets/Icons/Home/education.svg"
    };
    return GridView.builder(
      shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: actions.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 3
        ),
        itemBuilder: (context,index){
          return HomeButtons(
              sectionName: actions.keys.elementAt(index),
              icon: actions.values.elementAt(index)
          );
        }
    );
  }






}
