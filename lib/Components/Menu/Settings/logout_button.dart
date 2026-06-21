import 'package:flutter/material.dart';

import '../../../Server/Authentication/api_client.dart';
class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          foregroundColor:Colors.red,
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
          )
      ),
      onPressed: () async {
        await ApiClient.clearToken();
        if (!context.mounted) return;
        Navigator.pushNamedAndRemoveUntil(context, 'Start', (route) => false);
      },
      child: Row(
        children: [
          Text("Logout"),
          SizedBox(width: 8),
          Icon(Icons.logout)
        ],
      ),
    );
  }
}
