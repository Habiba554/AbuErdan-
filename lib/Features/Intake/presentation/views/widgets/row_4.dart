import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Row4 extends StatelessWidget {
  const Row4({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required TextEditingController feedIntakeController2,
  }) : _feedIntakeController2 = feedIntakeController2;

  final double screenWidth;
  final double screenHeight;
  final TextEditingController _feedIntakeController2;

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
                  text: 'Feed Type #2',
                ),
              ),
              CustomTextField(
                textEditingController: _feedIntakeController2,
                hint: 'kg',
              ),
            ],
          ),
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
                  text: 'Feed Batch #3',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomDropDown(
                  dropdownvalue: AppCubit.get(context).dropdownvalue,
                  items: AppCubit.get(context).items,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
