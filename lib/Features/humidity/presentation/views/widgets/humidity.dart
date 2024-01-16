// ignore: file_names
import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class HumidityPage extends StatelessWidget {
  const HumidityPage({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required TextEditingController humidity1,
    required TextEditingController humidity2,
    required TextEditingController humidity3,
  })  : _humidity1 = humidity1,
        _humidity2 = humidity2,
        _humidity3 = humidity3;

  final double screenWidth;
  final double screenHeight;
  final TextEditingController _humidity1;
  final TextEditingController _humidity2;
  final TextEditingController _humidity3;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text('Humidity',
                  style: TextStyle(
                      color: kPrimarycolor, fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          spacing: screenWidth * 0.4,
          children: [
            humidityMorning(screenHeight),
            humidityMidDay(mediaQuery),
          ],
        ),
        humidityEvening(mediaQuery),
      ],
    );
  }

  Padding humidityEvening(MediaQueryData mediaQuery) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: mediaQuery.size.height * 0.019,
                left: mediaQuery.size.height * 0.015),
            child: CustomText(
              text: 'Humidity Evening',
            ),
          ),
          CustomTextField(
            textEditingController: _humidity3,
            hint: '%',
          ),
        ],
      ),
    );
  }

  Column humidityMidDay(MediaQueryData mediaQuery) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: mediaQuery.size.height * 0.019,
              left: mediaQuery.size.height * 0.025),
          child: CustomText(
            text: 'Humidity Mid-day',
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: mediaQuery.size.height * 0.01),
          child: CustomTextField(
            textEditingController: _humidity2,
            hint: '%',
          ),
        )
      ],
    );
  }

  Padding humidityMorning(double screenHeight) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: screenHeight * 0.019, left: screenHeight * 0.015),
            child: CustomText(
              text: 'Humidity Morning',
            ),
          ),
          CustomTextField(
            textEditingController: _humidity1,
            hint: '%',
          ),
        ],
      ),
    );
  }
}
