
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:byteblocks/presentation/state_holders/email_save_controller.dart';
import 'package:byteblocks/presentation/state_holders/featured_products_controller.dart';
import 'package:byteblocks/presentation/ui/screeens/main_bottom_nav_screen.dart';
import 'package:byteblocks/presentation/ui/screeens/signin_screen.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
import 'package:byteblocks/presentation/ui/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // Instantiate your controllers
  final EmailSaveController emailController = Get.find<EmailSaveController>();
  final FeaturedProductController featuredProductController = Get.find<FeaturedProductController>();

  @override
  void initState() {
    super.initState();
    // Call the async function to load featured products
    featuredProductController.getFeaturedProducts(Urls.featuredProduct);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _getNextScreen(), // Get the next screen based on email existence
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While waiting for the future to resolve, show a loading indicator or splash
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasData) {
          return AnimatedSplashScreen(
            splash: Center(
              child: Lottie.asset('${AssetsPaths.lottiePath}/splash.json'),
            ),
            centered: true,
            curve: Curves.easeInOut,
            splashIconSize: 400,
            nextScreen: snapshot.data!, // Use the resolved next screen
          );
        }
        // In case of an error, you can return an error widget
        return const Center(child: Text('Error loading next screen'));
      },
    );
  }

  // Method to check if the email exists in SharedPreferences
  Future<Widget> _getNextScreen() async {
    bool hasEmail = await emailController.hasEmail(); // Check if email exists
    return hasEmail ? const MainBottomNavScreen() : const SigninScreen(); // Return appropriate screen
  }
}
