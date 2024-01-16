import 'package:abuerdan2/Features/Intake/presentation/views/widgets/row_1.dart';
import 'package:abuerdan2/Features/Intake/presentation/views/widgets/row_2.dart';
import 'package:abuerdan2/Features/Intake/presentation/views/widgets/row_3.dart';
import 'package:abuerdan2/Features/Intake/presentation/views/widgets/row_4.dart';
import 'package:abuerdan2/Features/Intake/presentation/views/widgets/row_5.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IntakePage extends StatelessWidget {
  IntakePage({super.key});
  final TextEditingController _feedIntakeController1 = TextEditingController();
  final TextEditingController _feedIntakeController2 = TextEditingController();
  final TextEditingController _feedIntakeController3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row1(screenWidth: screenWidth, screenHeight: screenHeight),
            Row2(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                feedIntakeController1: _feedIntakeController1),
            Row3(screenWidth: screenWidth, screenHeight: screenHeight),
            Row4(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                feedIntakeController2: _feedIntakeController2),
            Row5(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                feedIntakeController3: _feedIntakeController3),
          ],
        ),
      ),
    );
  }
}
