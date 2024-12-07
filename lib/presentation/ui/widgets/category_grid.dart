import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:byteblocks/presentation/ui/screeens/category_wise_product_screen.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';

class CategoryGrid extends StatelessWidget {
  final List<Map<String, String>> imageArray = [
    {'imgLink': '${AssetsPaths.imagesPath}/casing.svg', 'name': 'CASING'},
    {'imgLink': '${AssetsPaths.imagesPath}/cpu.svg', 'name': 'CPU'},
    {'imgLink': '${AssetsPaths.imagesPath}/cooler.svg', 'name': 'CPU COOLER'},
    {'imgLink': '${AssetsPaths.imagesPath}/gpu.svg', 'name': 'GPU'},
    {'imgLink': '${AssetsPaths.imagesPath}/keyboard.svg', 'name': 'KEYBOARD'},
    {'imgLink': '${AssetsPaths.imagesPath}/monitor.svg', 'name': 'MONITOR'},
    
    {'imgLink': '${AssetsPaths.imagesPath}/mouse.svg', 'name': 'MOUSE'},
    {'imgLink': '${AssetsPaths.imagesPath}/powersupply.svg', 'name': 'PSU'},
    {'imgLink': '${AssetsPaths.imagesPath}/ram.svg', 'name': 'RAM'},
    {'imgLink': '${AssetsPaths.imagesPath}/rom.svg', 'name': 'ROM'},
    {'imgLink': '${AssetsPaths.imagesPath}/motherboard.svg', 'name': 'MOTHERBOARD'},
    {'imgLink': '${AssetsPaths.imagesPath}/speaker.svg', 'name': 'SPEAKER'},
    {'imgLink': '${AssetsPaths.imagesPath}/ssd.svg', 'name': 'SSD'},
    {'imgLink': '${AssetsPaths.imagesPath}/ups.svg', 'name': 'UPS'},
  ];

  final int? limit;

  CategoryGrid({super.key, this.limit});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),

        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: limit != null ? 4 : 3, // Dynamic crossAxisCount
          childAspectRatio: 1.0,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
        ),
        itemCount: limit ?? imageArray.length,
        itemBuilder: (context, index) {
          final image = imageArray[index];
          return GestureDetector(
            onTap: () {
              // Navigate to the CategoryWiseProductScreen
              Get.to(const CategoryWiseProductScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300), arguments: {'name': image['name']});
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(221, 177, 216, 216),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        image['imgLink']!, // Your SVG file path
                        fit: BoxFit.contain, // Adjust the fit as needed
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 39, 66, 70),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        image['name']!,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.white, // Simplified text color
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
