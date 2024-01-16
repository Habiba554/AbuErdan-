import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/side_bar_provider.dart';

class ElevatedButtonIcon extends StatelessWidget {
  final Function() onpress;
  final String text;
  final int bodyNum;
  final double padding;

  const ElevatedButtonIcon(
      {super.key,
      required this.onpress,
      required this.text,
      required this.bodyNum,
      required this.padding});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onpress,
      icon: const Icon(
        Icons.arrow_forward_ios,
        size: 12.0,
      ),
      label: Text(text, textAlign: TextAlign.start),
      style: ElevatedButton.styleFrom(
          foregroundColor:
              Provider.of<SideBarBody>(context).getcolor() == bodyNum
                  ? const Color(0xFF262424)
                  : kTextColor,
          backgroundColor: kSideBar,
          padding: EdgeInsets.only(right: padding),
          elevation: 0.0 // NEW
          ),
    );
  }
}
