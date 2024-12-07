import 'package:byteblocks/presentation/ui/widgets/category_grid.dart';
import 'package:byteblocks/presentation/ui/widgets/gradient_text.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  const Category({super.key});

 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
                child: GradientText(
                  text: 'All Category', // Example string
                ),
              ),
              Expanded(
                child: CategoryGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
