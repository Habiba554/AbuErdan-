import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class Energy extends StatelessWidget {
  const Energy({
    super.key,
    required TextEditingController energy1,
  }) : _energy1 = energy1;
  final TextEditingController _energy1;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Energy Source',
                  style: TextStyle(
                    color: kPrimarycolor,
                  )),
            )
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
                    child: const Text('Energy Source Type',
                        style: TextStyle(
                          color: Colors.black,
                        )),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.019, left: screenHeight * 0.025),
                  child: const Text('Energy Source Batch',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomDropDown(
                    dropdownvalue: AppCubit.get(context).dropdownvalue,
                    items: AppCubit.get(context).items,
                  ),
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: screenHeight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.019, left: screenHeight * 0.015),
                    child: const Text('Energy Source Consumed',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                  ),
                  CustomTextField(
                    textEditingController: _energy1,
                    hint: 'Energy Consumption',
                  )
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
                                'Energy Source Type',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Energy Source Batch',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Energy Source Consumed',
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
