import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
import 'package:flutter/material.dart';

class HeaderView extends StatelessWidget {
  List<String> sliderImages =['${AssetsPaths.imagesPath}/slider2.png','${AssetsPaths.imagesPath}/slider1.jpg','${AssetsPaths.imagesPath}/slider3.jpg','${AssetsPaths.imagesPath}/slider4.jpg','${AssetsPaths.imagesPath}/slider5.png'];
 HeaderView({ super.key });

  @override
  Widget build(BuildContext context){
    return CarouselView(itemExtent: MediaQuery.of(context).size.width -20, 
    elevation: 5,
    padding: const EdgeInsets.all(1),
    
    shape: Border.all(width: 2),
itemSnapping: true,
    children: List.generate(sliderImages.length, (index) {
      return Image.asset(sliderImages[index],fit: BoxFit.fill,);
    },));
  }
}