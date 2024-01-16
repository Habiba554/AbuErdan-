import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Row3 extends StatelessWidget {
  const Row3({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

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
                  text: 'Feed Batch #2',
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: screenHeight * 0.019, left: screenHeight * 0.015),
                child: CustomText(
                  text: 'Feed Intake #2',
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
