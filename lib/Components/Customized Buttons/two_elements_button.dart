import 'package:flutter/material.dart';

class TwoElementsButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget first;
  final Widget second;
  const TwoElementsButton({super.key, required this.onPressed, required this.first, required this.second});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xffC96868),
          foregroundColor: Colors.white,
          fixedSize: Size(1000, 48),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            first,
            SizedBox(width: 8,),
            second
          ],
        )
    );
  }
}
