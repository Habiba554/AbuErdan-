import 'package:abuerdan2/constant.dart';
import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class Energyss extends StatelessWidget {
  const Energyss({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    ScrollController _controller = ScrollController();
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Row(
              children: [
                Text('Energy Deliveries',
                    style: TextStyle(
                        color: kPrimarycolor, fontWeight: FontWeight.w500))
              ],
            ),
          ),
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
                          top: screenHeight * 0.019,
                          left: screenHeight * 0.015),
                      child: CustomText(
                        text: 'Energy Source Type',
                      ),
                    ),
                    CustomTextField(),
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
                          top: screenHeight * 0.019,
                          left: screenHeight * 0.015),
                      child: CustomText(
                        text: 'Batch No.',
                      ),
                    ),
                    CustomTextField(),
                  ],
                ),
              ),
            ],
          ),
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
                          top: screenHeight * 0.019,
                          left: screenHeight * 0.015),
                      child: CustomText(
                        text: 'Quantity',
                      ),
                    ),
                    CustomTextField(),
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
                          top: screenHeight * 0.019,
                          left: screenHeight * 0.015),
                      child: CustomText(
                        text: 'Houses',
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
          ),
        ],
      ),
    );
  }
}
