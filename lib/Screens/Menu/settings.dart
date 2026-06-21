import 'package:family_hub/Components/Menu/Settings/font_customized.dart';
import 'package:family_hub/Components/Menu/Settings/language_menu.dart';
import 'package:family_hub/Components/Menu/Settings/logout_button.dart';
import 'package:family_hub/Components/Menu/Settings/voice_assistant.dart';
import 'package:flutter/material.dart';

import '../../Components/App Bar/main_app_bar.dart';
import '../../Components/Menu/Drawer/main_drawer.dart';
import '../../Components/Menu/Settings/theme_toggle.dart';

class Settings extends StatelessWidget {
  Settings({super.key});

  @override
  TextStyle titlesStyle = TextStyle(
    color: Color(0xFF9B4747),
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(title: "Settings"),
      endDrawer: MainDrawer(),
      body: settingsBody(),
    );
  }

  Widget settingsBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Theme", style: titlesStyle),
          SizedBox(height: 8),
          ThemeToggle(),
          SizedBox(height: 24),
          Text("Language", style: titlesStyle),
          SizedBox(height: 8),
          LanguageMenu(),
          SizedBox(height: 24),
          Text("Font", style: titlesStyle),
          SizedBox(height: 8),
          FontCustomized(),
          SizedBox(height: 24),
          VoiceAssistant(),
          SizedBox(height: 24),
          LogoutButton()

        ],
      ),
    );
  }
}
