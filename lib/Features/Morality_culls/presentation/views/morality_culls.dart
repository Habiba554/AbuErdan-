import 'package:flutter/material.dart';
import 'widgets/culls.dart';
import 'widgets/morality.dart';

// ignore: must_be_immutable
class MoralityPage extends StatelessWidget {
  MoralityPage({super.key});
  final ScrollController _controller = ScrollController();
  final TextEditingController _weight1 = TextEditingController();
  final TextEditingController _weight2 = TextEditingController();
  final TextEditingController _quantity1 = TextEditingController();
  final TextEditingController _quantity2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return SingleChildScrollView(
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Morality(
              weight: _weight1,
              quantity: _quantity1,
            ),
            SizedBox(height: mediaQuery.size.height * 0.03),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 199, 198, 198),
              height: 0,
              indent: 1,
              endIndent: 1,
            ),
            SizedBox(height: mediaQuery.size.height * 0.03),
            Culls(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                quantity2: _quantity2,
                weight2: _weight2),
            SizedBox(height: mediaQuery.size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
