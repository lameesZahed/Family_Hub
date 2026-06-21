import 'package:flutter/material.dart';

class GenderBox extends StatefulWidget {
   String selectedValue;
   final ValueChanged<String> onChange;
   GenderBox({super.key, required this.selectedValue, required this.onChange});

  @override
  State<GenderBox> createState() => _GenderBoxState();
}

class _GenderBoxState extends State<GenderBox> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: DropdownButtonFormField(
          borderRadius: BorderRadius.circular(16),
          dropdownColor: Colors.white,
          style: TextStyle(
              color: Colors.black,
              fontSize: 12
          ),
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            labelText: "Gender",
            hintText: "Select Gender",
            hintStyle: TextStyle(
                color: Color(0xFFC4B7A6),
                fontSize: 12
            ),
          ),
          icon: Icon(Icons.arrow_drop_down),
          value: widget.selectedValue,
          items: [
            DropdownMenuItem(value:"Female" ,child: Text("Female"),),
            DropdownMenuItem(value:"Male" ,child: Text("Male"),)
          ],
          onChanged: (value){
            setState(() {
              widget.onChange(value!);
            });
          }
      ),
    );
  }
}
