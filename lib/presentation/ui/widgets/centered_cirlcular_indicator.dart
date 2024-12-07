import 'package:flutter/material.dart';
class CenteredCirlcularIndicator extends StatefulWidget {
const CenteredCirlcularIndicator({ super.key });

  @override
  State<CenteredCirlcularIndicator> createState() => _CenteredCirlcularIndicatorState();
}



class _CenteredCirlcularIndicatorState extends State<CenteredCirlcularIndicator> {
  @override

 

  @override
  Widget build(BuildContext context){
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}