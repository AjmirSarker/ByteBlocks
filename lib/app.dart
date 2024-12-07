import 'package:byteblocks/controller_binder.dart';
import 'package:byteblocks/presentation/state_holders/featured_products_controller.dart';
import 'package:byteblocks/presentation/ui/screeens/splash_screen.dart';
import 'package:byteblocks/presentation/ui/utils/urls.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
class ByteBlocks extends StatefulWidget {
const ByteBlocks({ super.key });

  @override
  State<ByteBlocks> createState() => _ByteBlocksState();
}

class _ByteBlocksState extends State<ByteBlocks> {
 
  @override
  void initState() {
    super.initState();
    Get.put(FeaturedProductController());
    // _loadProduct();
  }

  Future<void> _loadProduct() async {
    Get.find<FeaturedProductController>().getFeaturedProducts(Urls.featuredProduct);
  }
  
  @override
  Widget build(BuildContext context){
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        navigationBarTheme:const NavigationBarThemeData(
           
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(
              fontWeight: FontWeight.bold,
              color:  Color.fromARGB(255, 77, 40, 52),
            )
          )
        ),
      
        appBarTheme:const AppBarTheme(
          backgroundColor: Color.fromARGB(204, 154, 209, 211),
        ),
        inputDecorationTheme:const InputDecorationTheme(
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500
          ),
          filled: true,
          fillColor: Colors.white,
          labelStyle: TextStyle(
           color: Color.fromARGB(221, 1, 97, 100),

          ),
         
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(
              color:  Color.fromARGB(255, 4, 151, 170),

            )
          ),
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color:  Color.fromARGB(255, 4, 151, 170),
            )
          ),
          focusedErrorBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.red
            )
          ),
          errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.red
            )
          )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            fixedSize: const Size.fromWidth(double.maxFinite),
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6)
            ),
            backgroundColor: const Color.fromARGB(255, 72, 104, 104),
            foregroundColor: Colors.white
          )
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 240, 245, 250)
      ),
      home:const SafeArea(child: SplashScreen()),
      initialBinding: ControllerBinder(),
    );
  }
}