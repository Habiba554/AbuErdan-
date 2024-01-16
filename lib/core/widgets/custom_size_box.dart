import 'package:flutter/material.dart';

class CustomSizeBox extends StatelessWidget {
  final Widget child;
  const CustomSizeBox({super.key, required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 250.0,
      height: 40.0,
      child: child,
    );
  }
}