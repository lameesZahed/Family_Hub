import 'package:flutter/material.dart';

class ThemeToggle extends StatefulWidget {
   ThemeToggle({super.key});

  @override
  State<ThemeToggle> createState() => _ThemeToggleState();
}

class _ThemeToggleState extends State<ThemeToggle> {
  bool isLight = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: Color(0xFF308983).withOpacity(0.7),
              width: 1
            ),
            color: Color(0xFFF0F0F0),
          ),
        ),
        AnimatedAlign(
            alignment: isLight?Alignment.centerLeft:Alignment.centerRight,
            duration: Duration(milliseconds: 100),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 8),
            child: Container(
              width: MediaQuery.of(context).size.width/2 -32 ,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 18,
                    offset: const Offset(0, 4),
                  )
                ]
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: (){
                    setState(() {
                      isLight =! isLight;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.sunny,color: Color(0xFF016B61),),
                      SizedBox(width: 8,),
                      Text("Light",style: TextStyle(color: Color(0xFF9B4747)),),
                      SizedBox(width: 4,)

                    ],
                  ),
                ),
              ),
              // SizedBox(width: 84,),
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: (){
                    setState(() {
                      isLight =! isLight;
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.dark_mode,color: Color(0xFF016B61),),
                      SizedBox(width: 8,),
                      Text("Dark",style: TextStyle(color: Color(0xFF9B4747)),),
                      SizedBox(width: 4,)
                    ],
                  ),
                ),
              )
            ]
        )
      ],
    );
  }
}
