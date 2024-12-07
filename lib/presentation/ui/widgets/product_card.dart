import 'package:byteblocks/presentation/state_holders/pc_build_controller.dart';
import 'package:byteblocks/presentation/ui/screeens/main_bottom_nav_screen.dart';
import 'package:byteblocks/presentation/ui/screeens/product_details_screen.dart';
import 'package:byteblocks/presentation/ui/utils/app_colors.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ProductCard extends StatelessWidget {
  final String sId;
  final String img1;
  final String model;
  final String brand;
  final dynamic avgRatings;
  final double price;
  final String status;
  final String category;
  final String? option;


  const ProductCard({
    super.key,
    required this.sId,
    required this.img1,
    required this.model,
    required this.brand,
    required this.avgRatings,
    required this.price,
    required this.status,
    required this.category,
    this.option,
    
  });
  
  
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 285,
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 177, 216, 216),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(125),
                  child: FadeInImage.assetNetwork(
                    placeholder: '${AssetsPaths.imagesPath}/offlineImage.png',
                    image: img1,
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
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  model,
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              const SizedBox(height: 4),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Text(brand),
                    const Spacer(),
                    const Icon(Icons.star, color: Colors.amber, size: 18),
                    const SizedBox(width: 4),
                    Text(avgRatings.toString()),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '\$ $price',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                      color: Colors.black),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 0),
            child: Text(
              status,
              style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Material(
              color: AppColors.primaryColors,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: option == 'choose'   ? !status.contains("Out")?   GestureDetector(
                onTap:() {  
 onAddTap();
Get.to(const MainBottomNavScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Add",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ): GestureDetector(
              
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Disabled",
                    style: TextStyle(color: Color.fromARGB(255, 112, 4, 4)),
                  ),
                ),
              ):GestureDetector(
                onTap:(){
onDetailsTap(sId);
                },
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Details",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  void onDetailsTap(String id) {
    Get.to(const ProductDetailsScreen(),arguments: {'id':id},  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),);
  }
   void onAddTap() {
    
    Get.find<PcBuildController>().addToBuild(category, { 'model': model,
      'image': img1,
      'price': price,
      'brand': brand,});
  }
}
