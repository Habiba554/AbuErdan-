import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Medicationss extends StatelessWidget {
  Medicationss({super.key});
  final TextEditingController _quantity = TextEditingController();
  //TextEditingController _justification = TextEditingController();
  //TextEditingController _comment = TextEditingController();
  final ScrollController _controller = ScrollController();

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
          const Padding(
            padding: EdgeInsets.all(0.0),
            child: Row(
              children: [
                Icon(Icons.medication, color: kPrimarycolor, weight: 6.5),
                Text('Medication Deliveries',
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
                        text: 'Medication Name',
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
                          top: screenHeight * 0.019,
                          left: screenHeight * 0.015),
                      child: CustomText(
                        text: 'Batch No.',
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
                        text: 'Serial Number',
                      ),
                    ),
                    CustomTextField(
                      textEditingController: _quantity,
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
                        text: 'Recommended Age',
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
                        text: 'Expiration Date',
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
                        text: 'Withdrawal period',
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
              SizedBox(
                width: screenWidth * 0.4,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
