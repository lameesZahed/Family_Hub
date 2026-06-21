import 'package:family_hub/Components/Menu/Drawer/header.dart';
import 'package:family_hub/Components/Menu/Drawer/storage_usage.dart';
import 'package:family_hub/Components/Menu/Settings/theme_toggle.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFFFFF4EA),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Header(),
            SizedBox(height: 16,),
            drawerListTile(Icons.notifications_none_rounded,"Notification",context,),
            drawerListTile(Icons.account_balance_wallet_rounded,"Payment Methods",context,),
            drawerListTile(Icons.bookmark_border_rounded,"Saved",context),
            drawerListTile(Icons.family_restroom_rounded,"Family Management",context),
            drawerListTile(Icons.phone,"Support",context,),
            drawerListTile(Icons.article_rounded,"Terms & Conditions",context,),
            drawerListTile(Icons.settings,"Settings",context,),
            // DrawerListTile(Icons.logout,"Log out",context,),
            Spacer(),
            Divider(
              color: Color(0xFFD1D3D4),
              thickness: 1,
            ),
            StorageUsage(),
            // Divider(
            //   color: Color(0xFFD1D3D4),
            //   thickness: 1,
            // ),
            SizedBox(height: 50,),
            // Row(
            //   children: [
            //     Icon(Icons.info_outline,color: Color(0xFF6E5C52),),
            //     SizedBox(width: 8,),
            //     Text("Color theme",style: TextStyle(color: Color(0xFF6E5C52).withOpacity(0.6)))
            //   ],
            // ),



          ],
        ),
      ),

    );
  }


  Widget drawerListTile(IconData icon,String title,BuildContext context){
    return ListTile(
      leading: Icon(icon,color: Color(0xFF016B61),),
      title: Text(title,style: TextStyle(
        color: Color(0xFF9B4747),
        fontWeight: FontWeight.w600,
        fontSize: 14
      )),
      onTap: (){
        Navigator.pushNamed(context, title);
      },
    );
  }


}
