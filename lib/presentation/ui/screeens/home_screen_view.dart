// ignore_for_file: prefer_const_constructors

import 'package:byteblocks/auth/auth_service.dart';

import 'package:byteblocks/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:byteblocks/presentation/state_holders/email_save_controller.dart';

import 'package:byteblocks/presentation/ui/screeens/signin_screen.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';
import 'package:byteblocks/presentation/ui/widgets/category_grid.dart';
import 'package:byteblocks/presentation/ui/widgets/featured_products_widget.dart';
import 'package:byteblocks/presentation/ui/widgets/gradient_text.dart';
import 'package:byteblocks/presentation/ui/widgets/header_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class HomeScreenView extends StatefulWidget {
//   const HomeScreenView({super.key});

//   @override
//   _HomeScreenViewState createState() => _HomeScreenViewState();
// }

// class _HomeScreenViewState extends State<HomeScreenView> {
//   final _auth = AuthService();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _numberTaker = TextEditingController();
//   final TextEditingController _textTaker = TextEditingController();
//   final BottomNavbarController _navBarController = Get.find<BottomNavbarController>();
 

//   // Function to validate the form and show a SnackBar message
//   void _validateForm() {
//     if (_formKey.currentState?.validate() == true) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Form is valid!'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please correct the errors in the form'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     _numberTaker.dispose();
//     _textTaker.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(
//           actions: [
//             IconButton(
//               onPressed: () async {
//                 await _auth.signOutEmail();
//                 Get.find<EmailSaveController>().removeEmail(); // This is safe now
//                 Get.offAll(const SigninScreen(),  transition: Transition.rightToLeft,  duration: const Duration(milliseconds: 500),);
//               },
//               icon: Icon(Icons.logout_outlined),
//               color: const Color.fromARGB(255, 43, 12, 12),
//             ),
//           ],
//           title: GradientText(text: "PC Builder"),
//           leading: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ClipOval(
//               child: Image.asset(
//                 '${AssetsPaths.imagesPath}/icon.png',
//                 height: 20, // Adjust size as needed
//                 width: 20,  // Keep height and width the same for a round shape
//                 fit: BoxFit.cover, // Ensures the image covers the oval shape
//               ),
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: ListView(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height / 2.8,
//                 child: HeaderView(),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       children: [
//                         GradientText(text: 'Categories'),
//                         Spacer(),
//                         TextButton(
//                           onPressed: () {
//                             _navBarController.changeSelectedIndex(1);
//                           },
//                           child: Text(
//                             'see all >>',
//                             style: TextStyle(color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // Wrapping GridView with SizedBox to give it bounded height
//                     Padding(
//                       padding: const EdgeInsets.all(2),
//                       child: SizedBox(
//                         height: 200,
//                          // You can adjust the height as per your design
//                         child: CategoryGrid(limit: 8),
//                       ),
//                     ),
                  
                   
                  
//                   ],
//                 ),
//               ),
//                SizedBox(height: 5,),
//               GradientText(text: 'Featured Products'),
//               GradientText(text: 'Featured Products'),
//                SizedBox(height: 5,),
//                GradientText(text: 'Featured Products'),
//                SizedBox(height: 5,),
//                GradientText(text: 'Featured Products'),
//               //  FeaturedProductsWidget(),
//                SizedBox(height: 5,),
//                GradientText(text: 'Featured Products'),
//                SizedBox(height: 5,),
               
          
               
//                 //  FeaturedProductsWidget()
              
          
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  _HomeScreenViewState createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  final _auth = AuthService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _numberTaker = TextEditingController();
  final TextEditingController _textTaker = TextEditingController();
  final BottomNavbarController _navBarController = Get.find<BottomNavbarController>();

  void _validateForm() {
    if (_formKey.currentState?.validate() == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Form is valid!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please correct the errors in the form'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    _numberTaker.dispose();
    _textTaker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                await _auth.signOutEmail();
                Get.find<EmailSaveController>().removeEmail();
                Get.offAll(const SigninScreen(),
                  transition: Transition.rightToLeft,
                  duration: const Duration(milliseconds: 500),
                );
              },
              icon: Icon(Icons.logout_outlined),
              color: const Color.fromARGB(255, 43, 12, 12),
            ),
          ],
          title: GradientText(text: "PC Builder"),
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                '${AssetsPaths.imagesPath}/icon.png',
                height: 20,
                width: 20,
                fit: BoxFit.cover,
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(  // Wrap the Column with SingleChildScrollView
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.8,
                child: HeaderView(),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GradientText(text: 'Categories'),
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            _navBarController.changeSelectedIndex(1);
                          },
                          child: Text(
                            'see all >>',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: SizedBox(
                        height: 200,
                        child: CategoryGrid(limit: 8),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5),
              GradientText(text: 'Featured Products'),
              SizedBox(height: 5),
              // You can add more featured product sections or widgets here.
              // The content will now be scrollable and won't cause overflow
            SizedBox(
              height: 900,
              child: FeaturedProductsWidget(),
            )
            ],
          ),
        ),
      ),
    );
  }
}
