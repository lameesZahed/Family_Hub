import 'package:family_hub/Components/Authentication/code_box.dart';
import 'package:family_hub/Components/Authentication/question.dart';
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:family_hub/Components/Authentication/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/Authentication/Family/family_bloc.dart';
import '../../../Bloc/Authentication/Family/family_event.dart';
import '../../../Bloc/Authentication/Family/family_state.dart';
import '../../../Bloc/Authentication/auth_bloc.dart';
import '../../../Bloc/Authentication/auth_event.dart';

class CreateFamily extends StatefulWidget {
  CreateFamily({super.key});

  @override
  State<CreateFamily> createState() => _CreateFamilyState();
}

class _CreateFamilyState extends State<CreateFamily> {
  final familyNameController = TextEditingController();

  final familyNameFocusNode = FocusNode();

  @override
  void dispose() {
    familyNameController.dispose();
    familyNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final String signupRelation = ModalRoute.of(context)?.settings.arguments as String? ?? "OTHER";
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Create Your Family",
                    style: TextStyle(color: Color(0xFF9B4747), fontSize: 24),
                  ),
                  SizedBox(height: 40),
                  Text(
                    "What do you want to name your Family?",
                    style: TextStyle(
                      color: Color(0xFF6E5C52),
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 8),
                  TextFieldCustom(
                    // name: "Family Name",
                    labelBehavior: FloatingLabelBehavior.never,
                    hint: "Enter your Family name",
                    controller: familyNameController,
                    focusNode: familyNameFocusNode,
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),
              SizedBox(height: 56),
              //line horizontal
              // Divider(
              //   color: Color(0xFFC96868), // لون الخط
              //   thickness: 1,       // سمك الخط
              // ),
              // غيري الـ CodeBox عشان يعرض الكود اللي رجع من الـ backend

              BlocConsumer<FamilyBloc, FamilyState>(
                listener: (context, state) {
                  if (state is FamilyError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.message), backgroundColor: Colors.red),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state is FamilyCreated)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "What will be your Family ID",
                              style: TextStyle(
                                color: Color(0xFF6E5C52),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            CodeBox(length: 4, familyId: state.familyCode, enabled: false),
                          ],
                        ),
                      SizedBox(height: 200),
                      Button(
                        text: state is FamilyLoading
                            ? "Creating..."
                            : (state is FamilyCreated ? "Continue" : "Get Started"),
                        onPressed: state is FamilyLoading
                            ? null
                            : () {
                          if (state is FamilyCreated) {
                            context.read<AuthBloc>().add(GetMeEvent());

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (context.mounted) {
                                Navigator.pushReplacementNamed(context, "Home");
                              }
                            });
                            return;
                          }
                          if (familyNameController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Please enter a family name")),
                            );
                            return;
                          }
                          context.read<FamilyBloc>().add(
                            CreateFamilyEvent(familyNameController.text,signupRelation),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       "What will be your Family ID",
              //       style: TextStyle(
              //         color: Color(0xFF6E5C52),
              //         fontSize: 16,
              //         fontWeight: FontWeight.normal,
              //       ),
              //     ),
              //     CodeBox(length: 4,familyId: "",),
              //   ],
              // ),
              // SizedBox(height: 200),
              // Button(text: "Get Started", onPressed: () {}),
              Question(
                question: "Already Have Family?",
                answer: "Log in to your Family",
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    'Create Family',
                    arguments: signupRelation,
                  );
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
