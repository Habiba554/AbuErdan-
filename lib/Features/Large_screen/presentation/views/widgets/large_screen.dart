import 'package:abuerdan2/Features/Large_screen/presentation/views/large_screen.dart';
import 'package:abuerdan2/core/widgets/custom_side_bar.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: kBackgroundcolor,
      body: Row(
        children: [
          Expanded(child: SideBar()),
          const Flexible(
            flex: 5,
            child: CustomLargeScreen(),
          )
        ],
      ),
    );
  }
}
