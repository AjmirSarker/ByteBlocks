import 'package:byteblocks/auth/auth_service.dart';
import 'package:byteblocks/presentation/ui/widgets/email_field.dart';
import 'package:byteblocks/presentation/ui/widgets/signin_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _auth = AuthService();
  final TextEditingController _emailController = TextEditingController(); // Email Input
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Function to validate form
  void _validateForm() async {
    if (_formKey.currentState?.validate() == true) {
      // Perform sign-up actions, such as calling AuthService or showing confirmation
 // Example function
 await _auth.ForgotPassword(_emailController.text);

  Get.back( );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SignInAnimation(logo: 'forgot'), // Lottie Animation
                  const SizedBox(height: 15),
                  const Text('Enter your email address to send password reset email',style: TextStyle(color:   Color.fromARGB(255, 72, 104, 104),
)),
                  const SizedBox(height: 15),
                  EmailField(controller: _emailController), // Email Input
                  const SizedBox(height: 15),
                  
                  
                  ElevatedButton(
                    onPressed: _validateForm,
                    child: const Text('Send Email', style: TextStyle(fontSize: 17)),
                  ),
              
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
