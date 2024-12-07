

import 'dart:math';

import 'package:byteblocks/presentation/ui/utils/all_function_class.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
import 'package:byteblocks/presentation/ui/widgets/centered_cirlcular_indicator.dart';
import 'package:byteblocks/presentation/ui/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:byteblocks/presentation/state_holders/single_product_controller.dart';
import 'package:byteblocks/presentation/ui/utils/app_colors.dart';
import 'package:byteblocks/presentation/ui/utils/urls.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  _ProductDetailsScreenState createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final SingleProductController productController = Get.find<SingleProductController>();
  final Map<String, dynamic> arguments = Get.arguments;

  @override
  void initState() {
    super.initState();
    _loadProduct();
  }

  Future<void> _loadProduct() async {
    final String url = '${Urls.singleProduct}/${arguments['id']}';
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await productController.getProduct(url);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: GetBuilder<SingleProductController>(
            builder: (productController) {
              final product = productController.singleProduct;
          
              return Column(
                children: [
                  const SizedBox(height: 10,),
                 detailItemsHeader(),
                  Visibility(
                    visible: !productController.inProgress,
                    replacement: const CenteredCirlcularIndicator(),
                    child: Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(height: 10),
                      
                          
                          // Use null-aware operator with a fallback image
                          detailImage(image: product?.img2 ?? '${AssetsPaths.imagesPath}/offlineImage.png'),
          
                          productDetails(product),
          
                          // Check if reviews are available before rendering the section
                          if (product?.reviews != null && product!.reviews!.isNotEmpty)
                            reviewsSection(product.reviews!),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  // Image section for the product
  SizedBox detailImage({required String image}) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 240, 232, 232),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.green[400]!,
                    blurRadius: 15,
                    offset: const Offset(0, 8),
                  ),
                ],
                borderRadius: BorderRadius.circular(250),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: FadeInImage.assetNetwork(
                  placeholder: '${AssetsPaths.imagesPath}/offlineImage.png',
                  image: image,
                  width: 140,
                  height: 120,
                  fit: BoxFit.fill,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      '${AssetsPaths.imagesPath}/offlineImage.png',
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Header of the product detail page
  Padding detailItemsHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,),
      child: Column(
        children: [
          Row(
            children: [
              Material(
                color: const Color.fromARGB(218, 44, 170, 170),
                borderRadius: BorderRadius.circular(10),
                child: const BackButton(color: Colors.white),
              ),
              const Spacer(),
              const GradientText(
                text: 'Detail Product',
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 15,)
        ],
      ),
    );
  }

  // Product details section
  Container productDetails(product) {
    if (product == null) return Container(); // Handle null product case
    return Container(
      color: const Color.fromARGB(255, 240, 232, 232),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${product.model}',
                      maxLines: 2,
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
                    ),
                    Text(
                      '৳ ${product.price}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: AppColors.primaryColors),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 27),
          const Text(
            'Product Details',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(
            '${product.details}',
            style: const TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 25),
          Material(
            
            color: AppColors.primaryColors,
            borderRadius: BorderRadius.circular(15),
            child: !product.status.contains("Out")?GestureDetector(
  onTap: () {
    // Handle the tap action here
    int randomSixDigitNumber = 100000 + Random().nextInt(900000);
      AllFunctionClass().sslCommerzGeneralCall(product.price ,'$randomSixDigitNumber');
  },
  child: Container(
    height: 65,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 21),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color.fromARGB(255, 72, 104, 104), // Add a background color if needed
    ),
    child: const Text(
      "Buy Now",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
):GestureDetector(
  
  child: Container(
    height: 65,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(vertical: 21),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: const Color.fromARGB(255, 99, 2, 2), // Add a background color if needed
    ),
    child: const Text(
      "Disabled",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

          ),
          const SizedBox(height: 10),
          additionalProductInfo(product),
        ],
      ),
    );
  }

  // Additional product information section
  Column additionalProductInfo(product) {
    if (product == null) return const Column(); // Handle null product case
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (product.status != null) Text('Status: ${product.status}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.avgRatings != null) Text('Average Ratings: ${product.avgRatings}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.sensorResolution != null) Text('Sensor Resolution: ${product.sensorResolution}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.weight != null) Text('Weight: ${product.weight}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.keys != null) Text('Keys: ${product.keys}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.dimension != null) Text('Dimension: ${product.dimension}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.speed != null) Text('Speed: ${product.speed}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.airFlow != null) Text('Air Flow: ${product.airFlow}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.socket != null) Text('Socket: ${product.socket}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.systemRequirements != null) Text('System Requirements: ${product.systemRequirements}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.hotKeys != null) Text('Hot Keys: ${product.hotKeys}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.inputSensitivity != null) Text('Input Sensitivity: ${product.inputSensitivity}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.frequencyResponse != null) Text('Frequency Response: ${product.frequencyResponse}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
        if (product.type != null) Text('Type: ${product.type}', style: const TextStyle(fontSize: 16, color: Colors.black54)),
const SizedBox(height: 15,)
],
    );
  }

  // Product reviews section
Column reviewsSection(List<dynamic> reviews) {
  return Column(
    children: [
      const SizedBox(height: 15,),
      const Text(
        'Customer Reviews',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          final review = reviews[index]; // Assuming review is just a string
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10), // Add margin for spacing
            padding: const EdgeInsets.all(10), // Padding inside the Container
            decoration: BoxDecoration(
              color: Colors.grey[200], // Light background color for the review
              borderRadius: BorderRadius.circular(10), // Rounded corners for the container
            ),
            child: ListTile(
              title: Text(review), // Directly show the review string
            ),
          );
        },
      ),
    ],
  );
}



}



