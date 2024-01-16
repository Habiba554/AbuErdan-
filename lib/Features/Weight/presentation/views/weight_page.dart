import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WeightPage extends StatelessWidget {
  WeightPage({super.key});
  final TextEditingController _weight = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return SingleChildScrollView(
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          spacing: screenWidth * 0.13,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: screenHeight * 0.019, left: screenHeight * 0.015),
              child: CustomText(
                text: 'Weight',
              ),
            ),
            CustomTextField(
              textEditingController: _weight,
              hint: 'Kg',
            ),
            SizedBox(height: mediaQuery.size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
