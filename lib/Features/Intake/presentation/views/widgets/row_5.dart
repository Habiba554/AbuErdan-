import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Row5 extends StatelessWidget {
  const Row5({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required TextEditingController feedIntakeController3,
  }) : _feedIntakeController3 = feedIntakeController3;

  final double screenWidth;
  final double screenHeight;
  final TextEditingController _feedIntakeController3;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runAlignment: WrapAlignment.spaceBetween,
      spacing: screenWidth * 0.4,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.019, left: screenHeight * 0.015),
                child: CustomText(
                  text: 'Feed Type #3',
                ),
              ),
              CustomTextField(
                textEditingController: _feedIntakeController3,
                hint: 'kg',
              ),
            ],
          ),
        ),
        SizedBox(
          width: screenWidth * 0.4,
        ),
      ],
    );
  }
}
