import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LanguageMenu extends StatefulWidget {
  const LanguageMenu({super.key});

  @override
  State<LanguageMenu> createState() => _LanguageMenuState();
}

class _LanguageMenuState extends State<LanguageMenu> {
  late String currentValue;
  TextEditingController languageController = TextEditingController();

  Map<String,String> language = {
    "English":"assets/Icons/Language/English.svg",
    "Arabic":"assets/Icons/Language/Arabic.svg"
  };

  @override
  void initState() {
    currentValue = language.keys.first;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    languageController.text = currentValue;
    return DropdownMenu(
        controller: languageController,
        width: double.infinity,
        onSelected: (value){
          setState(() {
            currentValue = value!;
          });
        },
        leadingIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(language[languageController.text]!),
        ) ,
        dropdownMenuEntries: [
          DropdownMenuEntry(
              value: language.keys.first,
              label: language.keys.first,
              leadingIcon: SvgPicture.asset(language[language.keys.first]!)),
          DropdownMenuEntry(
              value: language.keys.last,
              label: language.keys.last,
              leadingIcon: SvgPicture.asset(language[language.keys.last]!)),
        ]
    );
  }
}
