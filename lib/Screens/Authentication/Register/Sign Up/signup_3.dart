import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../Bloc/Authentication/auth_bloc.dart';
import '../../../../Bloc/Authentication/auth_state.dart';
import '../../../../Components/Authentication/step_progress_indecator.dart';
import '../../../../Components/Customized Buttons/button.dart';

class Signup3 extends StatefulWidget {
  final Function (int) onTap;
  final Function(String) onDataSaved;
  const Signup3({super.key, required this.onTap, required this.onDataSaved});

  @override
  State<Signup3> createState() => _Signup3State();
}

class _Signup3State extends State<Signup3> {
  final relationController = TextEditingController();

  final FocusNode relationFocusNode = FocusNode();

  String? selectedRelation;

  @override
  void dispose() {
    relationController.dispose();
    relationFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StepProgressIndecator(index: 3),
            SizedBox(height: 8),
            Text(
              "Select your Relationship",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff9B4747),
              ),
            ),
            SizedBox(height: 24),
            dropDownRole(),
            SizedBox(height: 280),
            Center(child:
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message), backgroundColor: Colors.red),
                  );
                }
                if (state is AuthSuccess) {
                }
              },
              builder: (context, state) {
                return Button(
                  text: state is AuthLoading ? "Loading..." : "Register",
                  onPressed: state is AuthLoading ? null : () {
                    if (relationController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select your relationship")),
                      );
                      return;
                    }
                    widget.onDataSaved(selectedRelation!);
                    widget.onTap(0);
                  },
                );
              },
            ),
            ),

          ],
        ),
      ),
    );

  }
  Widget dropDownRole(){
    Map<String,String> familyRelationship = {
      "Father":"assets/Icons/Family_tree/dad.svg",
      "Mother":"assets/Icons/Family_tree/mom.svg",
      "Daughter":"assets/Icons/Family_tree/girl.svg",
      "Son":"assets/Icons/Family_tree/boy.svg",
      "Grandmother":"assets/Icons/Family_tree/grandmother.svg",
      "Grandfather":"assets/Icons/Family_tree/grandmother.svg",
    };


    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: DropdownMenu(
            hintText: "Father",
            width: double.infinity,
            label: Text("Relationship"),
            controller: relationController,
            focusNode: relationFocusNode,
            onSelected: (value){
              setState(() {
                selectedRelation = value;
              });
            },
            dropdownMenuEntries:
              familyRelationship.entries.map((entry){
                // selectedRole = entry.key.toUpperCase();
                return DropdownMenuEntry(
                    value: entry.key.toUpperCase(),
                    label: entry.key,
                    leadingIcon: SvgPicture.asset(entry.value,height: 24,width: 24)
                );
              }).toList()

        )
    );
  }
}
