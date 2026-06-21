import 'package:flutter/material.dart';
class BoxDecorationAccounting extends StatelessWidget {
  final Widget child;
  const BoxDecorationAccounting({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                // spreadRadius: 5,
                blurRadius: 4,
              )]
        ),
      child: child ,
    );
  }
}
