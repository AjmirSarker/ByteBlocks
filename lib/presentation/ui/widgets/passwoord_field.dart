// password_field.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byteblocks/presentation/state_holders/password_controller.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final PasswordViewController passwordView;

  const PasswordField({super.key, required this.controller, required this.passwordView});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordViewController>(
      builder: (_) => TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Enter your password',
          suffixIcon: IconButton(
            icon: Icon(passwordView.passwordVisible ? Icons.visibility : Icons.visibility_off),
            onPressed: passwordView.changePasswordView,
          ),
        ),
        obscureText: !passwordView.passwordVisible,
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
      ),
    );
  }
}
