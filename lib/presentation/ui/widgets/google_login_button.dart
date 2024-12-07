// google_login_button.dart
import 'package:byteblocks/auth/auth_service.dart';
import 'package:byteblocks/presentation/state_holders/email_save_controller.dart';
import 'package:byteblocks/presentation/ui/screeens/main_bottom_nav_screen.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoogleLoginButton extends StatelessWidget {
 
  GoogleLoginButton({super.key});
final _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () async {
        // Add Google Sign-In logic here
 final user = await _auth.loginWithGoogle();
 if(user !=   null) {
 
       String? email = user.additionalUserInfo?.profile?['email'];
     if (email != null) {
  Get.find<EmailSaveController>().saveEmail(email); // This is safe now
}
   Get.snackbar(
    'Success', // Title of the snackbar
    'You have successfully signed in.', // Message in the snackbar
    snackPosition: SnackPosition.BOTTOM, // Position of the snackbar (can be TOP or BOTTOM)
    backgroundColor: Colors.green, // Background color of the snackbar
    colorText: Colors.white, // Text color
    duration: const Duration(seconds: 3), // Duration for how long the snackbar will be visible
  );
  Get.off(const MainBottomNavScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),);

      }},
      icon: Image.asset('${AssetsPaths.imagesPath}/googleIcon.png', height: 24), // Google logo image
      label: const Text(
        'Login with Google',
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)), backgroundColor: const Color.fromARGB(255, 95, 26, 21),
        padding: const EdgeInsets.symmetric(vertical: 12), // Set button color to Google theme
      ),
    );
  }
}
