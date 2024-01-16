import 'package:abuerdan2/Features/Energy_consumption/presentation/views/widgets/energy.dart';
import 'package:flutter/material.dart';

import 'widgets/other_consumption.dart';

// ignore: must_be_immutable
class EnergyPage extends StatelessWidget {
  EnergyPage({super.key});
  final ScrollController _controller = ScrollController();
  final TextEditingController _energy1 = TextEditingController();
  final TextEditingController _energy2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Energy(energy1: _energy1),
          SizedBox(height: mediaQuery.size.height * 0.03),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 199, 198, 198),
            height: 0,
            indent: 1,
            endIndent: 1,
          ),
          SizedBox(height: mediaQuery.size.height * 0.03),
          OtherConsumption(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              energy2: _energy2),
          SizedBox(height: mediaQuery.size.height * 0.03),
        ],
      ),
    );
  }
}
