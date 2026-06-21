import 'package:flutter/material.dart';

class FontCustomized extends StatefulWidget {
  const FontCustomized({super.key});

  @override
  State<FontCustomized> createState() => _FontCustomizedState();
}

class _FontCustomizedState extends State<FontCustomized> {
  List <String> font = ["Small","Medium","Large"];
  late int fontValue;

  @override
  void initState() {
    fontValue = 0;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: font.map((element){
            bool fontSelected = fontValue == font.indexOf(element) ;
            return Text(element,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xff6E5C52).withOpacity((fontSelected)?1:0.5))
            );
          }).toList(),
        ),
        Slider(
            divisions: 2,
            label: "$fontValue",
            allowedInteraction: SliderInteraction.tapAndSlide,
            max: 2,
            min: 0,
            value: fontValue.toDouble(),
            onChanged: (value){
              setState(() {
                fontValue = value.toInt();
              });
            }
        ),
      ],
    );
  }
}
