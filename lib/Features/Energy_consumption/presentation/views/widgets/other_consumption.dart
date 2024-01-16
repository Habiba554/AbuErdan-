import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class OtherConsumption extends StatelessWidget {
  const OtherConsumption({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required TextEditingController energy2,
  }) : _energy2 = energy2;

  final double screenWidth;
  final double screenHeight;
  final TextEditingController _energy2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(14.0),
                child: Text('Other Type Consumption',
                    style: TextStyle(
                      color: kPrimarycolor,
                    )),
              )
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
                        top: screenHeight * 0.019, left: screenHeight * 0.015),
                    child: CustomText(
                      text: 'Category Type',
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
                      text: 'Source Type',
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
                        top: screenHeight * 0.019, left: screenHeight * 0.015),
                    child: CustomText(
                      text: 'Source Batch',
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
                      text: 'Source Consumed',
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _energy2,
                    hint: 'Energy Consumption',
                  ),
                ],
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kBackgroundcolor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: ConstrainedBox(
                  constraints:
                      const BoxConstraints(minHeight: 40, minWidth: 500),
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        rows: const <DataRow>[
                          DataRow(
                            cells: <DataCell>[
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                              DataCell(Text('')),
                            ],
                          ),
                        ],
                        columns: const <DataColumn>[
                          DataColumn(
                            label: Expanded(
                              child: Text("Time",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: kPrimarycolor)),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Source Type',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Source Batch',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Source Consumed',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
