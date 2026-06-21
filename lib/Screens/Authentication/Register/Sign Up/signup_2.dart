import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Components/Authentication/step_progress_indecator.dart';
import '../../../../Components/Authentication/text_field_custom.dart';
import '../../../../Components/Customized Buttons/button.dart';

class Signup2 extends StatefulWidget {
  final Function (int) onTap;
  final Function(String, String, String, String, String) onDataSaved;
   Signup2({super.key, required this.onTap, required this.onDataSaved});

  @override
  State<Signup2> createState() => _Signup2State();
}

class _Signup2State extends State<Signup2> {
  late DateTime dof;
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final genderController = TextEditingController();

  final phoneController = TextEditingController();

  final dobController = TextEditingController();

  final FocusNode firstNameFocusNode = FocusNode();

  final FocusNode lastNameFocusNode = FocusNode();

  final FocusNode genderFocusNode = FocusNode();

  final FocusNode phoneFocusNode = FocusNode();

  final FocusNode dobFocusNode = FocusNode();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    genderController.dispose();
    phoneController.dispose();
    dobController.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    genderFocusNode.dispose();
    phoneFocusNode.dispose();
    dobFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StepProgressIndecator(index: 2),
          SizedBox(height: 8,),
          Text(
            "Personal Information",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color(0xff9B4747),
            ),
          ),
          SizedBox(height: 24),
          TextFieldCustom(
            name: "First Name",
            labelBehavior: FloatingLabelBehavior.always,
            // controller: firstNameController,
            hint: "Adam",
            controller: firstNameController,
            focusNode: firstNameFocusNode,
            nextFocusNode: lastNameFocusNode,
            keyboardType: TextInputType.name,
          ),  //First Name
          TextFieldCustom(
            name: "Last Name",
            labelBehavior: FloatingLabelBehavior.always,
            // controller: lastNameController,
            hint: "Smith",
            controller: lastNameController,
            focusNode: lastNameFocusNode,
            nextFocusNode: genderFocusNode,
            keyboardType: TextInputType.name,
          ),
          dropDownGender(),//Last Name
          // TextFieldCustom(
          //   name: "Gender",
          //   labelBehavior: FloatingLabelBehavior.always,
          //   // controller: genderController,
          //   hint: "Male",
          //   controller: genderController,
          //   focusNode: genderFocusNode,
          //   nextFocusNode: phoneFocusNode,
          // ),  //Gender
          TextFieldCustom(
            name: "Mobile Phone",
            labelBehavior: FloatingLabelBehavior.always,
            // controller: phoneController,
            hint: "0599999999",
            controller: phoneController,
            focusNode: phoneFocusNode,
            nextFocusNode: dobFocusNode,
            keyboardType: TextInputType.phone,
          ),  //Mobile Phone
          TextFieldCustom(
            name: "Date of Birth",
            labelBehavior: FloatingLabelBehavior.always,
            controller: dobController,
            onTap: ()=>Date(),
            hint: "2000-01-01",
            focusNode: dobFocusNode,
            // keyboardType: TextInputType.datetime,
          ),  //Date of Birth

          SizedBox(height: 24),
          Center(child: Button(text: "Next", onPressed: (){
            if (firstNameController.text.isEmpty || lastNameController.text.isEmpty || genderController.text.isEmpty || phoneController.text.isEmpty || dobController.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please fill in all fields")),
              );
              return;
            }
            widget.onDataSaved(firstNameController.text, lastNameController.text, genderController.text, phoneController.text, dobController.text);
            widget.onTap(3);
          })),

        ],
      ),
    );
  }


  Widget dropDownGender(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownMenu(
        hintText: "Male",
          focusNode: genderFocusNode,
          width: double.infinity,
          controller: genderController,
          label: Text("Gender"),
          dropdownMenuEntries: [
            DropdownMenuEntry(value: "Male", label: "Male",leadingIcon: Icon(Icons.male)),
            DropdownMenuEntry(value: "Female", label: "Female",leadingIcon: Icon(Icons.female))
          ]
      )
    );
  }

  Date() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),


    );
    if (selectedDate != null) {
      setState(() {
        dof = selectedDate;
        dobController.text = DateFormat("yyyy-MM-dd").format(selectedDate);
      });
    }
  }


}

//DropdownButtonFormField(
//         // value: gender,
//         hint: Text(
//           "Male",style: TextStyle(
//             color: Color(0xFFC4B7A6),
//             fontSize: 12
//         ),
//         ),
//         iconEnabledColor: Color(0xFF308983),
//         decoration: InputDecoration(
//           labelText: "Gender",
//           floatingLabelBehavior: FloatingLabelBehavior.always,
//         ),
//           style: TextStyle(
//             color: Colors.black87,
//             fontSize: 16
//           ),
//           items: [
//             DropdownMenuItem(
//                 value: "Male",
//                 child: Text("Male")
//             ),
//             DropdownMenuItem(
//                 value: "Female",
//                 child: Text("Female")
//             ),
//           ],
//           onChanged: (value){
//           setState(() {
//             gender = value!;
//           });
//           }
//       ),