import 'package:family_hub/Components/Authentication/code_box.dart';
import 'package:family_hub/Components/Authentication/question.dart';
import 'package:family_hub/Components/Customized%20Buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/Authentication/Family/family_bloc.dart';
import '../../../Bloc/Authentication/Family/family_event.dart';
import '../../../Bloc/Authentication/Family/family_state.dart';
import '../../../Bloc/Authentication/auth_bloc.dart';
import '../../../Bloc/Authentication/auth_event.dart';
import '../../../Bloc/Authentication/auth_state.dart';

class FamilyId extends StatefulWidget {
  const FamilyId({super.key});

  @override
  State<FamilyId> createState() => _FamilyIdState();
}

class _FamilyIdState extends State<FamilyId> {
   String enteredCode ="";

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
              Text(
                "Family ID",
                style: TextStyle(
                  color: Color(0xFF9B4747),
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Enter your 4-digit Family ID to log in to your Family and access all the features of the app.",
                style: TextStyle(color: Color(0xFF6E5C52), fontSize: 16),
              ),
              SizedBox(height: 40),

              CodeBox(
                length: 4,
                enabled: true,
                onCompleted: (code) {
                  enteredCode = code;
                },
              ),

              SizedBox(height: 56),

              BlocConsumer<FamilyBloc, FamilyState>(
                listener: (context, state) {
                  if (state is FamilyError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.message),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }

                  if (state is FamilyJoined) {
                    context.read<AuthBloc>().add(GetMeEvent());

                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (context.mounted) {
                        Navigator.pushReplacementNamed(context, 'Home');
                      }
                    });
                  }
                },
                builder: (context, state) {
                  return Button(
                    text: state is FamilyLoading ? "Logging in..." : "Log in",
                    onPressed: state is FamilyLoading
                        ? null
                        : () {
                      if (enteredCode.isEmpty || enteredCode.length != 4) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Please enter the 4-digit code"),
                          ),
                        );
                        return;
                      }
                      final authState = context.read<AuthBloc>().state;
                      // String userRelation = "OTHER"; // fallback
                      // if (authState is AuthSuccess) {
                      //   userRelation = authState.user.relationship ?? "OTHER";
                      //
                      // }
                      context
                          .read<FamilyBloc>()
                          .add(JoinFamilyEvent(enteredCode,signupRelation));
                    },
                  );
                },
              ),
              Question(
                question: "Don't have a Family?",
                answer: "Create new Family",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'Create Family');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}