import 'dart:math';

import 'package:byteblocks/presentation/state_holders/pc_build_controller.dart';
import 'package:byteblocks/presentation/ui/utils/all_function_class.dart';
import 'package:byteblocks/presentation/ui/widgets/gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:byteblocks/presentation/ui/screeens/category_wise_product_screen.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';

class PCBuilderPage extends StatelessWidget {
  final List<Map<String, String>> imageArray = [
    {'imgLink': '${AssetsPaths.imagesPath}/casing.svg', 'name': 'Casing'},
    {'imgLink': '${AssetsPaths.imagesPath}/cpu.svg', 'name': 'CPU'},
    {'imgLink': '${AssetsPaths.imagesPath}/cooler.svg', 'name': 'Cpu Cooler'},
    {'imgLink': '${AssetsPaths.imagesPath}/gpu.svg', 'name': 'GPU'},
    {'imgLink': '${AssetsPaths.imagesPath}/keyboard.svg', 'name': 'Keyboard'},
    {'imgLink': '${AssetsPaths.imagesPath}/monitor.svg', 'name': 'Monitor'},
    {'imgLink': '${AssetsPaths.imagesPath}/motherboard.svg', 'name': 'MotherBoard'},
    {'imgLink': '${AssetsPaths.imagesPath}/mouse.svg', 'name': 'Mouse'},
    {'imgLink': '${AssetsPaths.imagesPath}/powersupply.svg', 'name': 'PSU'},
    {'imgLink': '${AssetsPaths.imagesPath}/ram.svg', 'name': 'RAM'},
    {'imgLink': '${AssetsPaths.imagesPath}/rom.svg', 'name': 'ROM'},
    {'imgLink': '${AssetsPaths.imagesPath}/speaker.svg', 'name': 'Speaker'},
    {'imgLink': '${AssetsPaths.imagesPath}/ssd.svg', 'name': 'SSD'},
    {'imgLink': '${AssetsPaths.imagesPath}/ups.svg', 'name': 'UPS'},
  ];

  PCBuilderPage({super.key});

  // const PCBuilderPage({super.key});



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      
        body: GetBuilder<PcBuildController>(
        
          builder: (pcBuildController){
           
          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: GradientText(
                  text: 'PC Builder', // Example string
                ),
              ),
              Expanded(
                child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: imageArray.length,
                  itemBuilder: (context, index) {
                    String categoryName = imageArray[index]['name']!;
                  //  Map<String, dynamic> categoryData = pcBuildController.getDataForCategory(imageArray[index]['name']!);
                   Map<String, dynamic> categoryData = pcBuildController.getDataForCategory(imageArray[index]['name']!);
                
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // SVG Image
                              SizedBox(
                        width: 60,
                        height: 60,
                        child: categoryData.containsKey('image')
                            ? Image.network(
                                categoryData['image'], // Use the image URL
                                fit: BoxFit.contain,
                                errorBuilder: (context, error, stackTrace) {
                                  return SvgPicture.asset(
                                    imageArray[index]['imgLink']!,
                                    placeholderBuilder: (BuildContext context) =>
                                        const CircularProgressIndicator(),
                                    fit: BoxFit.contain,
                                  );
                                },
                              )
                            : SvgPicture.asset(
                                imageArray[index]['imgLink']!,
                                placeholderBuilder: (BuildContext context) =>
                                    const CircularProgressIndicator(),
                                fit: BoxFit.contain,
                              ),
                      ),
                            const SizedBox(width: 10), // Space between image and text
                
                            // Title and Subtitle in an Expanded Column
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  Text(
                                    categoryName,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 5), // Space between title and subtitle
                                  // Show additional details if available
                                  if (categoryData.isNotEmpty) ...[
                                    Text('Model: ${categoryData['model']}', style: const TextStyle(color: Color.fromARGB(255, 16, 91, 104))),
                                    Text('Brand: ${categoryData['brand']}', style: const TextStyle(color: Color.fromARGB(255, 16, 91, 104))),
                                    Text('Price: \$${categoryData['price'].toString()}', style: const TextStyle(color: Color.fromARGB(255, 16, 91, 104))),
                                  ],
                                ],
                              ),
                            ),
                
                            // Add a gap between the text and the button
                            const SizedBox(width: 10),
                
                            // Trailing Button
                           categoryData.containsKey('price')?   SizedBox(
                              width: 70, // Define a width for the button
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
                                ),
                                onPressed: () {
                                pcBuildController.removeFromBuild(categoryName);
                                },
                                child: const Text('Remove',style: TextStyle(color: Color.fromARGB(255, 243, 69, 56), ),),
                              ),
                            ):   SizedBox(
                              width: 70, // Define a width for the button
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  padding: WidgetStateProperty.all(const EdgeInsets.all(5)),
                                ),
                                onPressed: () {
                                  Get.to(
                                    const CategoryWiseProductScreen(),
                                    transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 300),
                                    
                                    arguments: {
                                      'option': 'choose',
                                      'name': categoryName,
                                    },
                                  );
                                },
                                child: const Text('Choose'),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    );
                  },
                ),
                        ),
              ),
             Container(
  color: Colors.grey.shade200,
  padding: const EdgeInsets.all(16.0),
  child: Row(
    children: [
      // Total Price Text and Value
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Price: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 16, 91, 104),
            ),
          ),
          Text(
          '\$${pcBuildController.totalPrice.toDouble()}',


            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 16, 91, 104),
            ),
          ),
        ],
      ),
      
      // Spacer to push the Buy Now button to the right
      const Spacer(),

      // Buy Now Button
    (pcBuildController.totalPrice).toInt() > 1 ?   SizedBox(
        width: 100, // Restrict the button width
        child: ElevatedButton(
          onPressed: ()  {
            int randomSixDigitNumber = 100000 + Random().nextInt(900000);

            // Navigate to checkout or trigger purchase process
          AllFunctionClass().sslCommerzGeneralCall( pcBuildController.totalPrice.toDouble(),'$randomSixDigitNumber');
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(11.0),
          ),
          child: const Text(
            'Buy Now',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ) : const Text(''),
    ],
  ),
),


               
            ],
          );
        
        })
      ),
    );
  }
}
