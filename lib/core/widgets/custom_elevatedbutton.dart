import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function() onpress;
  final String text;
  final int bodyNum;

  const CustomElevatedButton({
    super.key,
    required this.onpress,
    required this.text,
    required this.bodyNum,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ), // <-- Text
          const Icon(
            // <-- Icon
            Icons.more_horiz,
            size: 20,
            color: Colors.white,
          ),
        ],
      ),
      style: ElevatedButton.styleFrom(
          backgroundColor: kSideBar,
          minimumSize: const Size.fromHeight(50),
          elevation: 0.0 // NEW
          ),
    );
  }
}
