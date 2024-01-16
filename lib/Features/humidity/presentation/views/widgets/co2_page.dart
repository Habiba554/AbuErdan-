import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Co2Page extends StatelessWidget {
  const Co2Page({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required TextEditingController cO1,
    required TextEditingController cO2,
    required TextEditingController cO3,
  })  : _cO1 = cO1,
        _cO2 = cO2,
        _cO3 = cO3;

  final double screenWidth;
  final double screenHeight;
  final TextEditingController _cO1;
  final TextEditingController _cO2;
  final TextEditingController _cO3;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
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
                      text: 'Min Co2',
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _cO1,
                    hint: '%',
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.019, left: screenHeight * 0.025),
                  child: CustomText(
                    text: 'Max Co2',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenHeight * 0.01),
                  child: CustomTextField(
                    textEditingController: _cO2,
                    hint: '%',
                  ),
                )
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.019, left: screenHeight * 0.015),
                child: CustomText(
                  text: 'Avg Co2',
                ),
              ),
              CustomTextField(
                textEditingController: _cO3,
                hint: '%',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
