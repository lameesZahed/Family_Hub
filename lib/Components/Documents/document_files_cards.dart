import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Components/Documents/download_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

class DocumentFilesCards extends StatefulWidget {
  final String fileName;
  final double fileSize;
  final DateTime uploadDate;
  DocumentFilesCards({super.key, required this.fileName, required this.fileSize, required this.uploadDate});

  @override
  State<DocumentFilesCards> createState() => _DocumentFilesCardsState();
}

class _DocumentFilesCardsState extends State<DocumentFilesCards> {
  TextStyle dataTextStyle (double fontSize) {
    return TextStyle(
        color: Color(0xFF6E5C52),
        fontSize: fontSize

    );
  }

    bool expand = false;

    @override
    Widget build(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: GestureDetector(
          child: Card(
            color: Colors.white,
            elevation: 0.5,
            child: Column(
              children: [
                ListTile(
                  title: Text(widget.fileName,overflow: TextOverflow.ellipsis,),
                  titleTextStyle: dataTextStyle(16),
                  leading:SvgPicture.asset("assets/Icons/Document.svg"),
                  trailing: DownloadDialog(),
                ),
                Visibility(
                  visible: expand,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text("${widget.fileSize.toInt()} MB",style: dataTextStyle(12),),
                              SizedBox(width: 8,),
                              Text(DateFormat("d/M/yyyy").format(widget.uploadDate),style: dataTextStyle(12),),
                            ],
                          ),
                          Row(
                            children: [
                            IconButton(onPressed: (){}, icon: Icon(Icons.file_download_outlined,color: Color(0xFF35383F),)),
                            SizedBox(width: 8,),
                            SizedBox(width: 90,child: Button(text: "open", onPressed: (){}))
                          ],)
                        ],
                      ),
                    )
                )
              ],
            ),
          ),
          onTap: (){
            setState(() {
              expand = !expand;
            });
          },
        ),
      );
    }
}

