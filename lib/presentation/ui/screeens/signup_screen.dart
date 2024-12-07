// signup_screen.dart
import 'package:byteblocks/auth/auth_service.dart';
import 'package:byteblocks/presentation/state_holders/email_save_controller.dart';
import 'package:byteblocks/presentation/ui/screeens/signin_screen.dart';
import 'package:byteblocks/presentation/ui/utils/all_function_class.dart';
import 'package:byteblocks/presentation/ui/widgets/custom_richtext.dart';
import 'package:byteblocks/presentation/ui/widgets/email_field.dart';
import 'package:byteblocks/presentation/ui/widgets/google_login_button.dart';
import 'package:byteblocks/presentation/ui/widgets/passwoord_field.dart';
import 'package:byteblocks/presentation/ui/widgets/name_field.dart'; // Import NameField w
import 'package:byteblocks/presentation/ui/widgets/signin_animation.dart';
// Import Sign-in prompt
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byteblocks/presentation/state_holders/password_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _auth  = AuthService();
  final TextEditingController _nameController = TextEditingController(); // Name Input
  final TextEditingController _emailController = TextEditingController(); // Email Input
  final TextEditingController _passwordController = TextEditingController(); // Password Input
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PasswordViewController _passwordView = Get.find<PasswordViewController>();

  // Function to validate form
  void _validateForm() async{
    if (_formKey.currentState?.validate() == true) {
   final user=  await _auth.createUserWithEmailAndPassword(_emailController.text,_passwordController.text);
   if(user != null){
    print(user.email);
         String? email = user.email;
     if (email != null) {
  Get.find<EmailSaveController>().saveEmail(email); // This is safe now
}
      AllFunctionClass().showSnackBar(context, 'Form is valid! Sign Up Successful. ${user.email}', Colors.green);
     Get.off(const SigninScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),);
   }
    
    } else {
      AllFunctionClass().showSnackBar(context, 'Form is not valid!', Colors.red);
    }
  }
  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    // TODO: implement dispose
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
                  const SignInAnimation(logo: 'signUp',), // Lottie Animation
                  const SizedBox(height: 15),
                  NameField(controller: _nameController), // Name Input
                  const SizedBox(height: 15),
                  EmailField(controller: _emailController), // Email Input
                  const SizedBox(height: 15),
                  PasswordField(controller: _passwordController, passwordView: _passwordView), // Password Input
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: _validateForm,
                    child: const Text('Sign Up', style: TextStyle(fontSize: 17)),
                  ),
                  const SizedBox(height: 15),
                  GoogleLoginButton(), // Google Login Button
                  const SizedBox(height: 15),
                 const Align(
                    alignment: Alignment.center,
                    child: CustomRichText(
                            mainText: 'Have an account?',
                            highlightedText: 'Sign In.',
                            textColor: 'green',
                          ),
                  ), // "Have an account? Sign in." prompt
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
