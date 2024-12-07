// import 'package:byteblocks/presentation/state_holders/bottom_navbar_controller.dart';
// import 'package:byteblocks/presentation/state_holders/category_product_conotroller.dart';
// import 'package:byteblocks/presentation/state_holders/product_list_controller.dart';
// import 'package:byteblocks/presentation/ui/screeens/main_bottom_nav_screen.dart';
// import 'package:byteblocks/presentation/ui/utils/all_function_class.dart';
// import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
// import 'package:byteblocks/presentation/ui/utils/urls.dart';
// import 'package:byteblocks/presentation/ui/widgets/centered_cirlcular_indicator.dart';
// import 'package:byteblocks/presentation/ui/widgets/product_card.dart';
// import 'package:byteblocks/presentation/ui/widgets/gradient_text.dart'; // Ensure GradientText is imported
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CategoryWiseProductScreen extends StatefulWidget {
//   const CategoryWiseProductScreen({super.key});

//   @override
//   _CategoryWiseProductScreenState createState() => _CategoryWiseProductScreenState();
// }

// class _CategoryWiseProductScreenState extends State<CategoryWiseProductScreen> {
  
//   final CategoryProductController categoryController= Get.find<CategoryProductController>();
//    final BottomNavbarController _navBarController = Get.find<BottomNavbarController>();

//   @override
//   void initState() {
//     super.initState();
//     _cats(); 
//     _loadProduct();
//     // Load product when the widget is initialized
//   }

//   Future<void> _loadProduct() async {
//       // AllFunctionClass().showSnackBar(context, 'Form is valid! Sign In Successful. ${Urls.categoryProduct}/${Get.arguments}', Colors.green);
    
//     await  categoryController.getCategoryProducts('${Urls.categoryProduct}/${Get.arguments}');
//   }
//     Future<void> _cats() async {
//       AllFunctionClass().showSnackBar(context, 'Form is valid! Sign In Successful. ${Urls.categoryProduct}/${Get.arguments}', Colors.green);
    
  
//   }
 

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(onPressed: (){
//           // _navBarController.backToHome();
//           Get.to(const MainBottomNavScreen());
//           }, icon: const Icon(Icons.arrow_back)),

//         ),
//         body: GetBuilder<CategoryProductController>(
//           builder: (categoryListController) {
//             return Column(
//               children: [
//                 // Add GradientText at the top
//                  Padding(
//                   padding: EdgeInsets.symmetric(vertical: 20),
//                   child: GradientText(
//                     text: 'All ${Get.arguments}', // Example string
//                   ),
//                 ),
//                 Visibility(
//                   visible: !categoryListController.inProgress,
//                   replacement: const CenteredCirlcularIndicator(),
//                   child: Expanded(
//                     child: GridView.builder(
//                       itemCount: categoryListController.categoryProducts.length,
//                       padding: const EdgeInsets.all(16),
//                       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         mainAxisSpacing: 8,
//                         crossAxisSpacing: 8,
//                         mainAxisExtent: 285,
//                       ),
//                       itemBuilder: (context, index) {
//                         // Mock product if API data is empty
//                         final product = categoryListController.categoryProducts[index];
//                         return ProductCard(
//                           sId: product.sId ?? 'N/A', // Fallback for sId
//                           img1: product.img1 ?? '${AssetsPaths.imagesPath}/offlineImage.png', // Default image
//                           model: product.model ?? 'Unknown Model', // Fallback for model
//                           brand: product.brand ?? 'Unknown Brand', // Fallback for brand
//                           avgRatings: product.avgRatings ?? 0.0, // Fallback for avgRatings
//                           price: product.price ?? 0, // Fallback for price
//                           status: product.status ?? 'Unavailable', // Fallback for status
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:byteblocks/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:byteblocks/presentation/state_holders/category_product_conotroller.dart';


import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
import 'package:byteblocks/presentation/ui/utils/urls.dart';

import 'package:byteblocks/presentation/ui/widgets/centered_cirlcular_indicator.dart';
import 'package:byteblocks/presentation/ui/widgets/product_card.dart';
import 'package:byteblocks/presentation/ui/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryWiseProductScreen extends StatefulWidget {
  const CategoryWiseProductScreen({super.key});

  @override
  _CategoryWiseProductScreenState createState() => _CategoryWiseProductScreenState();
}

// 
class _CategoryWiseProductScreenState extends State<CategoryWiseProductScreen> {
  final CategoryProductController categoryController = Get.find<CategoryProductController>();
  final BottomNavbarController _navBarController = Get.find<BottomNavbarController>();
  final Map<String, dynamic> arguments = Get.arguments;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    // final String url = '${Urls.categoryProduct}/${Get.arguments}';
    // print('Loading products from URL: $url');
    // await categoryController.getCategoryProducts(url);
    final String url = '${Urls.categoryProduct}/${arguments['name']}';
  print('Loading products from URL: $url'); // Debugging line

  // Schedule the update after the current frame has finished building
  WidgetsBinding.instance.addPostFrameCallback((_) async {
    await categoryController.getCategoryProducts(url);
  });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   leading: IconButton(
        //     onPressed: () {
        //       Get.find<CategoryProductController>().clearCategoryProducts();
        //       Get.to(const MainBottomNavScreen());
        //     },
        //     icon: const Icon(Icons.arrow_back),
        //   ),
        // ),
        body: GetBuilder<CategoryProductController>(
          builder: (categoryListController) {
            return Column(
              children: [
               Padding(
               padding: const EdgeInsets.symmetric(horizontal: 15),
                 child: Row(
                              
                  children: [
                  
                    Material(
                             color: const Color.fromARGB(218, 44, 170, 170),
                             borderRadius: BorderRadius.circular(10),
                             child: const BackButton(color: Colors.white),
                           ),const Spacer(),
                   Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: GradientText(
                      text: 'All ${arguments['name']}', 
                    ),
                  ),
                  const Spacer()
                 ],),
               ),
                Visibility(
                  visible: !categoryListController.inProgress,
                  replacement: const CenteredCirlcularIndicator(),
                  child: Expanded(
                    child: categoryListController.categoryProducts.isNotEmpty 
                      ? GridView.builder(
                          itemCount: categoryListController.categoryProducts.length,
                          padding: const EdgeInsets.all(16),
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 8,
                            crossAxisSpacing: 8,
                            mainAxisExtent: 285,
                          ),
                          itemBuilder: (context, index) {
                            final product = categoryListController.categoryProducts[index];
                            return ProductCard(
                              sId: product.sId ?? 'N/A',
                              img1: product.img1 ?? '${AssetsPaths.imagesPath}/offlineImage.png',
                              model: product.model ?? 'Unknown Model',
                              brand: product.brand ?? 'Unknown Brand',
                              avgRatings: product.avgRatings ?? 0.0,
                              price: product.price ?? 0.0,
                              status: product.status ?? 'Unavailable',
                              option:arguments['option'],
                              category: product.category ?? 'Unknown Category',
                            );
                          },
                        )
                      : const Center(child: Text('No products found')),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}//changed

