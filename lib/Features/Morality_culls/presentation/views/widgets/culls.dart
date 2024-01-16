import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class Culls extends StatelessWidget {
  const Culls({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required TextEditingController quantity2,
    required TextEditingController weight2,
  })  : _quantity2 = quantity2,
        _weight2 = weight2;

  final double screenWidth;
  final double screenHeight;
  final TextEditingController _quantity2;
  final TextEditingController _weight2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.disabled_by_default,
                color: kPrimarycolor,
                weight: 6.5,
              ),
              Text('Culls',
                  style: TextStyle(
                    color: kPrimarycolor,
                  ))
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
                      text: 'Quantity',
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _quantity2,
                  )
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
                      text: 'Weight',
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _weight2,
                  )
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
                    child: Text('Culls',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: screenHeight * 0.019)),
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
                                'Quantity',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Weight',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Type',
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
