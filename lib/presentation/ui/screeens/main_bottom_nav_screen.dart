import 'package:byteblocks/presentation/state_holders/bottom_navbar_controller.dart';
import 'package:byteblocks/presentation/ui/screeens/category_screen.dart';

import 'package:byteblocks/presentation/ui/screeens/home_screen_view.dart';
import 'package:byteblocks/presentation/ui/screeens/pc_build_screen.dart';
import 'package:byteblocks/presentation/ui/screeens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({ super.key });

  @override
  // ignore: library_private_types_in_public_api
  _MainBottomNavScreenState createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final Color labelColor= Colors.white38;
  final BottomNavbarController _navBarController= Get.find<BottomNavbarController>();
  final List<Widget> _screens=[ const HomeScreenView(), const Category(),PCBuilderPage(),const  SearchAllProducts()];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavbarController>(builder: (context){return Scaffold(
      body: _screens[_navBarController.selectedIndex],
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color.fromARGB(221, 128, 197, 199),
        indicatorColor: const Color.fromARGB(131, 1, 97, 100),
        indicatorShape: const CircleBorder(),
       animationDuration:const Duration(seconds: 1),
     
        elevation: 5,
        
        
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home,color: Color.fromARGB(255, 77, 40, 40),), label: "Home", selectedIcon: Icon(Icons.house_outlined,color: Color.fromARGB(255, 226, 223, 223)),),
      NavigationDestination(selectedIcon: Icon(Icons.category_rounded,color: Color.fromARGB(255, 226, 223, 223),),icon: Icon(Icons.category_outlined,color: Color.fromARGB(255, 77, 40, 52),), label: "Category",),
      NavigationDestination(selectedIcon: Icon(Icons.laptop_chromebook_outlined,color: Color.fromARGB(255, 226, 223, 223)),icon: Icon(Icons.computer,color: Color.fromARGB(255, 77, 40, 40),), label: "PC build"),
      NavigationDestination(icon: Icon(Icons.search,), label: "Search",  selectedIcon: Icon(Icons.search_off_rounded,color: Color.fromARGB(255, 226, 223, 223)),)
      ],
      selectedIndex: _navBarController.selectedIndex,
      onDestinationSelected: _navBarController.changeSelectedIndex,),
    );});
  }
}