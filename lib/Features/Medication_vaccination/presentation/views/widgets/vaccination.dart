import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_dropdown.dart';
import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class Vaccination extends StatelessWidget {
  const Vaccination({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required TextEditingController vaccination,
    required TextEditingController vaccinationBirds,
    required this.mediaQuery,
  })  : _vaccination = vaccination,
        _vaccinationBirds = vaccinationBirds;

  final double screenHeight;
  final double screenWidth;
  final TextEditingController _vaccination;
  final TextEditingController _vaccinationBirds;
  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Icon(
                Icons.medication,
                size: screenHeight * 0.022,
                color: kPrimarycolor,
                weight: 6.5,
              ),
              const Text('Vaccination',
                  style: TextStyle(
                      color: kPrimarycolor, fontWeight: FontWeight.bold)),
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
                      text: 'Vaccination',
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
                      text: 'Vaccination Type',
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
                      text: 'Vaccination Consumed',
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _vaccination,
                    hint: 'Vaccination Consumption',
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
                    textEditingController: _vaccinationBirds,
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
                                'Vaccination\nName',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Vaccination\nBatch',
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: kPrimarycolor),
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Expanded(
                              child: Text(
                                'Vaccination\nConsumed',
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
        SizedBox(height: mediaQuery.size.height * 0.03),
      ],
    );
  }
}
