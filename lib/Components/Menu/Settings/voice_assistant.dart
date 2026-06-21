import 'package:flutter/material.dart';

class VoiceAssistant extends StatefulWidget {
  const VoiceAssistant({super.key});

  @override
  State<VoiceAssistant> createState() => _VoiceAssistantState();
}

class _VoiceAssistantState extends State<VoiceAssistant> {
  late bool voice;


  @override
  void initState() {
    voice = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: SwitchListTile(
        // activeColor: Color(0xFF9B4747),
        //   activeTrackColor:Color(0xFF9B4747) ,
          title: Text("Voice assistant",style: TextStyle(
              color: Color(0xFF9B4747),
              fontSize: 14,
              fontWeight: FontWeight.w600
          )),
          value: voice,
          onChanged: (value){
            setState(() {
              voice = value!;
            });
          }
      ),
    );
  }
}
