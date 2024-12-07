import 'package:byteblocks/presentation/state_holders/product_list_controller.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
import 'package:byteblocks/presentation/ui/utils/urls.dart';
import 'package:byteblocks/presentation/ui/widgets/centered_cirlcular_indicator.dart';
import 'package:byteblocks/presentation/ui/widgets/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

class SearchAllProducts extends StatefulWidget {
  const SearchAllProducts({super.key});

  @override
  State<SearchAllProducts> createState() => _SearchAllProductsState();
}

class _SearchAllProductsState extends State<SearchAllProducts> {
 
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ProductListController productController = Get.find<ProductListController>();
  // To store API results

  
  void _validateAndSearch() async {
    if (_formKey.currentState!.validate()) {
      try{
      //  Get.to(Demo());
       await   productController.getProductList('${Urls.nameProducts}/${_searchController.text}');
    Get.snackbar(
  'Success', // Title
  'Products Found', // Message
  backgroundColor: Colors.green,
  colorText: Colors.white, // To match the original styling
  snackPosition: SnackPosition.BOTTOM, // Position of the snackbar
);

   
  
    
    // _searchController.clear();
      }catch(e) {
  ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(' ${e.toString()} '),
          backgroundColor: Colors.yellow,
        ),
      );
      }
      // Perform the search action only if the form is valid
   
      // _performSearch(); // Uncomment when API is needed
    }
  }
   @override
  void dispose() {
   _searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GetBuilder<ProductListController>(
          builder: (productListController){
            return     Column(
            children: [
              // Search TextField with prefix and suffix icons
               Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      labelText: "Search products",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: _validateAndSearch, // Call search on press
                      ),
                    ),
                    validator: (value) {
                      // Basic validation: Check if the field is empty
                      if (value == null || value.isEmpty) {
                        return 'Please enter a search query';
                      }
                      return null;
                    },
                  ),
                ),
              ),
             
              Visibility(
                visible: !productListController.inProgress,
                replacement:const CenteredCirlcularIndicator(),
                child:Expanded(
                child: GridView.builder(
                  itemCount:  productListController.products.length,
                  padding: const EdgeInsets.all(16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 285,
                  ),
                  itemBuilder: (context, index) {
                   // Mock product if API data is empty
           final product =productListController.products[index];
                    return ProductCard(
          sId:product.sId ?? 'N/A', // Fallback for sId
          img1:product.img1 ??  '${AssetsPaths.imagesPath}/offlineImage.png', // Default image
          model:product.model ?? 'Unknown Model', // Fallback for model
          brand:product.brand ?? 'Unknown Brand', // Fallback for brand
          avgRatings:product.avgRatings ?? 0.0, // Fallback for avgRatings
          price:product.price ?? 0.0, // Fallback for price
          status:product.status ?? 'Unavailable',
          category: product.category??'No', // Fallback for status
          
        )
        
        ;
                  },
                ),
              ), ),
              
              // Display API search results in GridView
              
            ],
          );
          }
            
        ),
      ),
    );
  }
}
