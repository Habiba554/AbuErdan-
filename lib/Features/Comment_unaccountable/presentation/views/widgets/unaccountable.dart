import 'package:abuerdan2/core/widgets/custom_text.dart';
import 'package:abuerdan2/core/widgets/custom_textfield.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class Unaccountable extends StatelessWidget {
  const Unaccountable({
    super.key,
    required TextEditingController quantity,
    required TextEditingController justification,
  })  : _quantity = quantity,
        _justification = justification;
  final TextEditingController _quantity;
  final TextEditingController _justification;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(
                Icons.trending_up_sharp,
                color: kPrimarycolor,
                weight: 5,
              ),
              Text('unaccountable', style: TextStyle(color: kPrimarycolor))
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: CustomText(
                      text: 'Quantity',
                    ),
                  ),
                  CustomTextField(
                    textEditingController: _quantity,
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CustomText(
                  text: 'Justification',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _justification,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: mediaQuery.size.height * 0.017),
                  cursorColor: Colors.blueGrey,
                  decoration: InputDecoration(
                      hintStyle:
                          TextStyle(fontSize: mediaQuery.size.height * 0.015),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0x2F000000)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0x2F000000)))),
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: null,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
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
                                  'Justification',
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
        ),
      ],
    );
  }
}
