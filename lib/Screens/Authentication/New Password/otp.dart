import 'dart:async';
import 'package:family_hub/Components/Authentication/question.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../Bloc/Authentication/auth_bloc.dart';
import '../../../Bloc/Authentication/auth_event.dart';
import '../../../Bloc/Authentication/auth_state.dart';
import '../../../Components/Customized Buttons/button.dart';
import '../Register/register.dart';

class Otp extends StatefulWidget {
  final String email;
  const Otp({super.key, required this.email});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  Timer? _timer;
  int _secondsLeft = 60;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    setState(() {
      _secondsLeft = 60;
      _canResend = false;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft == 0) {
        timer.cancel();
        setState(() => _canResend = true);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  String get _timerText {
    final minutes = _secondsLeft ~/ 60;
    final seconds = _secondsLeft % 60;
    return '${minutes.toString().padLeft(1, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  String get _hashedEmail {
    if (widget.email.length <= 13) return widget.email;
    return widget.email.replaceRange(
      4,
      widget.email.length - 9,
      '*' * (widget.email.length - 13),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is PasswordResetEmailResent) {
          _startTimer();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('The verification link is sent again'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "OTP",
                  style: TextStyle(
                    color: Color(0xFF9B4747),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "We sent you a verification link to your email, click on it",
                  style: TextStyle(color: Color(0xFF6E5C52), fontSize: 16),
                ),
                const SizedBox(height: 24),

                // Timer
                Text(
                  _timerText,
                  style: TextStyle(
                    color: Color(0xFF9B4747).withOpacity(0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                const SizedBox(height: 16),

                Text.rich(
                  TextSpan(
                    text: "We sent a verification link to your email",
                    style: const TextStyle(
                      color: Color(0xFF6E5C52),
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: " $_hashedEmail",
                        style: TextStyle(
                          color: Color(0xFF9B4747).withOpacity(0.6),
                        ),
                      ),
                      const TextSpan(text: ". You can check your inbox."),
                    ],
                  ),
                ),

                // Resend Button
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    final isLoading = state is AuthLoading;

                    return Question(
                      question: "Didn't receive the link?",
                      answer: isLoading
                          ? "Sending..."
                          : _canResend
                          ? "Resend"
                          : "Resend in $_timerText",
                      onPressed: _canResend && !isLoading
                          ? () {
                        context.read<AuthBloc>().add(
                          ResendPasswordResetEvent(widget.email),
                        );
                      }
                          : () {},
                    );
                  },
                ),

                const SizedBox(height: 96),
                Center(
                  child: Button(
                    text: "Go to Login",
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Register(index: 0)),
                            (route) => false,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}