import 'package:family_hub/Components/Customized%20Buttons/add_button.dart';
import 'package:family_hub/Models/Documents/document_files_model.dart';
import 'package:flutter/material.dart';
import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Documents/document_files_cards.dart';
import '../../Components/Documents/upload_file_pop_up.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';

class Documents extends StatelessWidget {
   Documents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Documents"),
      endDrawer: MainDrawer(),
      body: DocumentsBody(),
      floatingActionButton: AddButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return UploadFilePopUp();
            }
          );
        },
      )
    );
  }
  Widget DocumentsBody(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: documentsList()
    );
  }

  Widget documentsList(){
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: DocumentFilesModel().documents.length,
      itemBuilder: (context,index){
        return DocumentFilesCards(
          fileName: DocumentFilesModel().documents[index].name,
          fileSize: DocumentFilesModel().documents[index].size,
          uploadDate: DocumentFilesModel().documents[index].uploadDate,
        );
      },
    );
  }


}


TextStyle style = TextStyle(
  color: Color(0xFF6E5C52),
  fontSize: 14,
  fontWeight: FontWeight.w500
);

// Row(
// mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// children: rowTitles.map((title){
// return Text(title,style: TextStyle(
// color: Color(0xFF6E5C52),
// fontSize: 14,
// fontWeight: FontWeight.w500
// ),);
// }).toList(),
// ),