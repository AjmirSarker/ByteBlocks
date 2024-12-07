// signin_animation.dart
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:byteblocks/presentation/ui/utils/assets_paths.dart';

class SignInAnimation extends StatelessWidget {
  final String logo;
  const SignInAnimation({super.key, required this.logo});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 3.3,
      child: Lottie.asset('${AssetsPaths.lottiePath}/$logo.json'),
    );
  }
}
