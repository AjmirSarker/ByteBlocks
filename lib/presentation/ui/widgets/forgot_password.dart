// forgot_password_text.dart
import 'package:byteblocks/presentation/ui/screeens/forget_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordText extends StatelessWidget {
  const ForgotPasswordText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Handle 'Forgot Password' logic here
          Get.to(const ForgotPasswordScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),);
        },
        child: const Text(
          'Forgot Password?',
          style: TextStyle(color: Color.fromARGB(255, 134, 12, 3), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
