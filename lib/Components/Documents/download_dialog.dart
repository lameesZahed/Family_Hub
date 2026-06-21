import 'package:flutter/material.dart';

class DownloadDialog extends StatelessWidget {
  const DownloadDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (context)=>[
        PopupMenuItem(
          value: "Download",
          textStyle: TextStyle(
              color: Color(0xFF6E5C52)
          ),
          onTap: (){},
          child: Text("Download"),
        ),
        PopupMenuItem(
          value: "Delete",
          onTap: (){},
          child: Text("Delete",style: TextStyle(color: Color(0xFFA9372C)
    )),
        ),
      ],
    );
  }
}
