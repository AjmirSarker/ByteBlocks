import 'package:get/get.dart';

class PcBuildController extends GetxController {
  // Initial State with ordered categories
  final Map<String, Map<String, dynamic>> build = {
    'Casing': {},         // 1. Casing
    'CPU': {},            // 2. CPU
    'Cpu Cooler': {},     // 3. CPU Cooler
    'GPU': {},            // 4. GPU
    'Keyboard': {},       // 5. Keyboard
    'Monitor': {},        // 6. Monitor
    'MotherBoard': {},    // 7. Motherboard
    'Mouse': {},          // 8. Mouse
    'PSU': {},            // 9. PSU
    'RAM': {},            // 10. RAM
    'ROM': {},            // 11. ROM
    'Speaker': {},        // 12. Speaker
    'SSD': {},            // 13. SSD
    'UPS': {},            // 14. UPS
  };

  double _totalPrice = 0.0; // To store the total price
  double get totalPrice => _totalPrice; // Getter to access the total price

  // Add to build method
  void addToBuild(String name, Map<String, dynamic> newProduct) {
    if (build.keys.contains(name)) {
      print('$name added to build');
      build[name] = newProduct; // Update the existing category with the new product
    } else {
      print('Category $name not found in build map.');
    }

    calculateTotalPrice(); // Recalculate total price
    update(); // Notify listeners
  }

  // Remove from build method
  void removeFromBuild(String category) {
    if (build.containsKey(category)) {
      build.remove(category); // Remove the product from the build map
      print('$category removed from build');
    } else {
      print('Category $category not found.');
    }

    calculateTotalPrice(); // Recalculate total price
    update(); // Notify listeners
  }

  // Method to get data for a specific category
  Map<String, dynamic> getDataForCategory(String category) {
    return build[category] ?? {}; // Return the category data or an empty map if it doesn't exist
  }

  // New method to calculate total price
  void calculateTotalPrice() {
    _totalPrice = 0.0; // Reset total price before recalculating

    build.forEach((key, value) {
      if (value.containsKey('price')) {
        _totalPrice += value['price']; // Add the price if it exists
      }
    });

    print('Total price calculated: $_totalPrice');
  }
  // Clear all build items and reset total price
  void clearBuild() {
    build.forEach((key, value) {
      build[key] = {}; // Clear each category's product
    });

    _totalPrice = 0.0; // Reset the total price
    print('All categories cleared, total price reset.');

    update(); // Notify listeners
  }
}
