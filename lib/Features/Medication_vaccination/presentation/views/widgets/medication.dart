import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class Medication extends StatelessWidget {
  const Medication(
      {super.key,
      required TextEditingController medication,
      required TextEditingController medicationBirds})
      : _medication = medication,
        _medicationBirds = medicationBirds;
  final TextEditingController _medication;
  final TextEditingController _medicationBirds;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(
                    Icons.medication,
                    color: kPrimarycolor,
                    weight: 6.5,
                  ),
                  Text('Medication',
                      style: TextStyle(
                        color: kPrimarycolor,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(42, 35),
                    backgroundColor: Colors.green,
                    // Background color
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Add Consumption',
                      ),
                      Icon(
                        // <-- Icon
                        Icons.check_sharp,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
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
                        top: screenHeight * 0.019, left: screenHeight * 0.015),
                    child: CustomText(
                      text: 'Medication Type',
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
                      text: 'Medication Consumed',
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _medication,
                    hint: 'Energy Consumption',
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
                      text: 'Application Route',
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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
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
                      text: 'Number of Birds',
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _medicationBirds,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: mediaQuery.size.height * 0.03),
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
                                'Medication\nName',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Medication\nBatch',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Medication\nConsumed',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Number of Live\nBirds',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'App\nRoute',
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
