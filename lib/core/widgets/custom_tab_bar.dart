import 'package:abuerdan2/core/helpers/responsiveness.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
  });
  final List<Widget> tabs;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return SliverAppBar(
      pinned: true,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: CustomPaint(
        child: TabBar(
          isScrollable: !ResponsiveWidget.isSmallScreen(context) ? false : true,
          unselectedLabelColor: kPrimarycolor,
          tabs: widget.tabs,
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: kPrimarycolor),
          indicatorColor: const Color.fromARGB(255, 95, 99, 101),
          labelColor: kTextColor,
          splashFactory: NoSplash.splashFactory,
          unselectedLabelStyle: TextStyle(
              fontSize: 14 / mediaQuery.textScaleFactor,
              fontWeight: FontWeight.bold,
              color: kPrimarycolor),
          labelStyle: TextStyle(
              fontSize: 15 / mediaQuery.textScaleFactor, color: kPrimarycolor),
        ),
      ),
    );
  }
}
