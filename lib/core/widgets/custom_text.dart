// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {

  String text;
  CustomText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:120,
      height: 20,
      child: Text(text,
          //overflow: TextOverflow.ellipsis,
          maxLines: null,
          softWrap: false,
          style:const TextStyle(color: Colors.black)),
    );
  }
}
