import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void ShowSnackBar(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(msg),
    backgroundColor: kPrimarycolor,
    padding: const EdgeInsets.all(12.0),
    showCloseIcon: true,
  ));
}
