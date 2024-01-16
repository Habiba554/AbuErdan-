import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomContainer extends StatelessWidget {
  Widget child;
  CustomContainer({super.key,required this.child});
  @override
  Widget build(BuildContext context) {
    //final mediaQuery = MediaQuery.of(context);
    return Center(
      child: Container(
        padding: const EdgeInsets.all(12.0),
        width: 1230,
        height: 650,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: child,
      ),
    );
  }
}
