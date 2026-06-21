import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EducationCards extends StatelessWidget {
  final String type;
  final String icon;
  final String image_url;
  final VoidCallback onTap;
  const EducationCards({super.key, required this.type, required this.icon, required this.image_url, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Ink.image(
          height: 200,
          image: AssetImage(image_url),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.xor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: onTap,
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xff308983)
                  ),
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset(icon,),
                  )
              ),
              SizedBox(height: 8,),
              Text(type,style: TextStyle(
                fontSize: 18,
                color: Colors.black
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
