// signin_screen.dart
import 'package:byteblocks/auth/auth_service.dart';
import 'package:byteblocks/presentation/state_holders/email_save_controller.dart';
import 'package:byteblocks/presentation/ui/screeens/main_bottom_nav_screen.dart';
import 'package:byteblocks/presentation/ui/utils/all_function_class.dart';
import 'package:byteblocks/presentation/ui/widgets/custom_richtext.dart';
import 'package:byteblocks/presentation/ui/widgets/email_field.dart';
import 'package:byteblocks/presentation/ui/widgets/forgot_password.dart';
import 'package:byteblocks/presentation/ui/widgets/google_login_button.dart';
import 'package:byteblocks/presentation/ui/widgets/passwoord_field.dart';
import 'package:byteblocks/presentation/ui/widgets/signin_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byteblocks/presentation/state_holders/password_controller.dart';


class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _auth = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PasswordViewController _passwordView = Get.find<PasswordViewController>();

  // Function to validate form
  void _validateForm() async {
    if (_formKey.currentState?.validate() == true)  {
    final user = await _auth.signInUserWithEmailAndPassword(_emailController.text, _passwordController.text);
    if(user != null){
      String? email = user.email;
     if (email != null) {
  Get.find<EmailSaveController>().saveEmail(email); // This is safe now
}
      AllFunctionClass().showSnackBar(context, 'Form is valid! Sign In Successful. ${user.email}', Colors.green);
      Get.offAll(const MainBottomNavScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),);
    
   }else{
    AllFunctionClass().showSnackBar(context, 'Form is valid! Sign In not Successful. ', Colors.red);
   }
    } else {
     AllFunctionClass().showSnackBar(context, 'Form is  not valid!', Colors.red);
    }
  }

  // Function to show SnackBar
   @override
  void dispose() {
   
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
                  const SignInAnimation(logo: 'signIn',), // Lottie Animation
                  const SizedBox(height: 15),
                  EmailField(controller: _emailController), // Email Input
                  const SizedBox(height: 15),
                  PasswordField(controller: _passwordController, passwordView: _passwordView), // Password Input
                  const SizedBox(height: 7),
                  const ForgotPasswordText(), // Forgot Password Link
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: _validateForm,
                    child: const Text('Login', style: TextStyle(fontSize: 17)),
                  ),
                  const SizedBox(height: 15),
                 
                   GoogleLoginButton(),
                  const SizedBox(height: 15),
                   const Align(
                    alignment: Alignment.center,
                    child: CustomRichText(
                            mainText: 'Don\'t have an account?',
                            highlightedText: 'Sign Up.',
                            textColor: 'green',
                          ),
                  ), // "Have an  Sign-up prompt
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
