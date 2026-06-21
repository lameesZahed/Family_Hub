import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class MedicationBox extends StatelessWidget {
  final String icon;
  final String imageUrl;
  final VoidCallback onTap;
  final String type;

  const MedicationBox({super.key, required this.icon, required this.imageUrl, required this.onTap, required this.type});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Ink.image(
          // height: 150,
          // width: double.infinity,
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
          alignment: Alignment(0.0, -0.32),
          colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.7), BlendMode.xor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: onTap,
                    style: IconButton.styleFrom(
                        backgroundColor: Color(0xff308983)
                    ),
                    icon: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(icon,height: 24,width: 24,),
                    )
                ),
              ),
              SizedBox(width: 8,),
              Text(type,style: TextStyle(
                  fontSize: 16,
                  color: Colors.black
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
