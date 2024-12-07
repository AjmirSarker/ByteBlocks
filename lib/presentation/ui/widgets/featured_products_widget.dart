import 'package:byteblocks/data/models/product_model.dart';
import 'package:byteblocks/presentation/state_holders/featured_products_controller.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
import 'package:byteblocks/presentation/ui/utils/urls.dart';
import 'package:byteblocks/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeaturedProductsWidget extends StatefulWidget {
  const FeaturedProductsWidget({super.key});

  @override
  _FeaturedProductsWidgetState createState() => _FeaturedProductsWidgetState();
}

class _FeaturedProductsWidgetState extends State<FeaturedProductsWidget> {
  @override
  void initState() {
    super.initState();
  
  }

  Future<void> _loadProduct() async {
    Get.find<FeaturedProductController>().getFeaturedProducts(Urls.featuredProduct);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<FeaturedProductController>(builder: (featuredProduct) {
        return Visibility(
          visible: !featuredProduct.inProgress, // Show grid when data is loaded
          replacement: const Center(
            child: CircularProgressIndicator(), // Show loader while data is being fetched
          ),
          child: GridView.builder(
                shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // Ensure the GridView doesn't try to expand infinitely
            itemCount: 6, // Limit to 6 items
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // 2 items per row
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 285, // Height for each item
            ),
            itemBuilder: (context, index) {
              final product = featuredProduct.featuredProducts[index];

              return ProductCard(
                sId: product.sId ?? 'N/A', // Fallback for sId
                img1: product.img1 ?? '${AssetsPaths.imagesPath}/offlineImage.png', // Default image
                model: product.model ?? 'Unknown Model', // Fallback for model
                brand: product.brand ?? 'Unknown Brand', // Fallback for brand
                avgRatings: product.avgRatings ?? 0.0, // Fallback for avgRatings
                price: product.price ?? 0.0, // Fallback for price
                status: product.status ?? 'Unavailable',
                category: product.category ?? 'No', // Fallback for category
              );
            },
          ),
        );
      }),
    );
  }
}
