// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/text_field_provider.dart';

class CustomDropDown extends StatefulWidget {
  String dropdownvalue;
  CustomDropDown({super.key, required this.dropdownvalue, required this.items});
  List<String> items;
  List<String> itm = [];

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      padding: const EdgeInsets.all(5.0),
      height: 35,
      width: 200,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFEEEEEE),
          ),
          BoxShadow(
            color: Color(0xFFe8ebe9),
            spreadRadius: -1.0,
            blurRadius: 6.0,
          ),
        ],
        border: Border.all(color: const Color(0x2F000000)),
        color: const Color(0xFFE8E8E8).withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          //disabledHint: const Text('--------------------'),
          focusColor: Colors.black45,
          // Initial Value
          value: widget.dropdownvalue,
          // Down Arrow Icon
          icon: const Icon(
            Icons.arrow_drop_down,
            size: 25,
          ),
          // Array list of items
          items: !Provider.of<FlagOfTextField>(context).getflag()
              ? widget.items.map(
                  (String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items,
                          style: TextStyle(
                              fontSize: mediaQuery.size.height * 0.018)),
                    );
                  },
                ).toList()
              : null,
          onChanged: !Provider.of<FlagOfTextField>(context).getflag()
              ? (String? newValue) {
                  setState(() {
                    widget.dropdownvalue = newValue!;
                  });
                }
              : null,
        ),
      ),
    );
  }
}
