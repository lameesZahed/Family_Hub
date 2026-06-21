import 'package:family_hub/Screens/Authentication/Register/Sign%20Up/signup_1.dart';
import 'package:family_hub/Screens/Authentication/Register/Sign%20Up/signup_2.dart';
import 'package:family_hub/Screens/Authentication/Register/Sign%20Up/signup_3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../Bloc/Authentication/auth_bloc.dart';
import '../../../../Bloc/Authentication/auth_event.dart';
import '../../../../Bloc/Authentication/auth_state.dart';

class SignupFlow extends StatefulWidget {
  const SignupFlow({super.key});

  @override
  State<SignupFlow> createState() => _SignupFlowState();
}

class _SignupFlowState extends State<SignupFlow> {
  int currentStep = 1;

  String email = '', password = '', firstName = '',
      lastName = '', gender = '', phone = '', relation = '',dob = '';


  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            'Family ID',
                (route) => false,
            arguments: relation,
          );        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.message)),
          );
        }
      },
      child: buildCurrentStep(),
    );
  }

  Widget buildCurrentStep() {
    switch (currentStep) {
      case 1:
        return Signup1(
          onTap: (step) => setState(() => currentStep = step),
          onDataSaved: (e, p) {
            email = e.trim();
            password = p;
          },
        );
      case 2:
        return Signup2(
          onTap: (step) => setState(() => currentStep = step),
          onDataSaved: (fn, ln, g,ph,d) {
            firstName = fn; lastName = ln;
            gender = g;phone = ph;dob = d;
          },
        );
      case 3:
        return Signup3(
          onTap: (_) {
          },
          onDataSaved: (r) {
            relation = r;

            context.read<AuthBloc>().add(
                SignupEvent(
                  email: email,
                  password: password,
                  firstName: firstName,
                  lastName: lastName,
                  gender: gender,
                  mobileNumber: phone,
                  dateOfBirth: dob,
                  relation: r,
                ));
          },
        );
      default:
        return Signup1(onTap: (_) {}, onDataSaved: (_, __) {});
    }
  }
}