import 'package:byteblocks/presentation/ui/screeens/signin_screen.dart';
import 'package:byteblocks/presentation/ui/screeens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomRichText extends StatelessWidget {
  final String mainText;  // The main text (e.g., "Already have an account?")
  final String highlightedText;  // The text to be highlighted (e.g., "Sign in")
  final String textColor; // The color for the highlighted text (name)

  const CustomRichText({
    super.key,
    required this.mainText,
    required this.highlightedText,
    this.textColor = 'green', // Default to green if not specified
  });

void navigate(){
 if(highlightedText.contains('Up')){
  Get.to(const SignupScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),);
 }else{
  Get.to(const SigninScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),);
 }
}
  // Function to convert color name to Color
  Color _getColorFromName(String colorName) {
    switch (colorName.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      // Add more colors as needed
      default:
        return Colors.green; // Default color if the name doesn't match
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: mainText, // Main text
              style: const TextStyle(color: Colors.black), // Default text color
            ),
            TextSpan(
              text: ' $highlightedText', // Highlighted text
              style: TextStyle(
                color: _getColorFromName(textColor), // Convert name to Color
                fontWeight: FontWeight.bold, // Optional: Make it bold
              ),
            ),
          ],
        ),
      ),
    );
  }
}
