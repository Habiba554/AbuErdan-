// ignore_for_file: must_be_immutable

import 'package:abuerdan2/core/Provider/text_field_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CustomTextField extends StatelessWidget {
  Widget? child;
  String? hint;
  Function(String)? onChanged;
  final TextEditingController? textEditingController;
  CustomTextField(
      {super.key, this.child, this.hint, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(9.0),
      height: 36,
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
        color: const Color(0xFFE8E8E8).withOpacity(0.5),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: textEditingController,
        readOnly: Provider.of<FlagOfTextField>(context).getflag(),
        minLines: 1,
        style: const TextStyle(color: Colors.black, fontSize: 16),
        cursorColor: Colors.blueGrey,
        decoration: InputDecoration(
            isDense: true,
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 12),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x2F000000)),
            ),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0x2F000000)))),
      ),
    );
  }
}
