import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EmailSaveController extends GetxController {
  // Method to save the email to SharedPreferences
  Future<void> saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    update(); // Notify GetBuilder to update the UI if needed
  }

  // Method to remove the email from SharedPreferences
  Future<void> removeEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    update(); // Notify GetBuilder to update the UI if needed
  }

  // Method to check if the email exists in SharedPreferences
  Future<bool> hasEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('email'); // Return true if email exists
  }
}
