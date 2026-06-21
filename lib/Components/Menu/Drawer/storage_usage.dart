
import 'package:flutter/material.dart';

class StorageUsage extends StatelessWidget {
  const StorageUsage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFD1D3D4),
              width: 1
            ),
            borderRadius: BorderRadius.circular(16),
          ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.cloud,color: Color(0xFF308983),),
                  SizedBox(width: 8,),
                  Text("Storage Usage",style: TextStyle())
                ],
              ),
              SizedBox(height: 8,),
              Text("1.23 MB / 200.0 MB"),
              SizedBox(height: 8,),
              LinearProgressIndicator(
                value: 0.3,
              ),
              TextButton(
                  onPressed: (){},
                  style: TextButton.styleFrom(
                    foregroundColor: Color(0xFF9B4747),
                  ),
                  child: Text("View Details")
              )
            ],
          ),
        ),
      ),
    );
  }
}
