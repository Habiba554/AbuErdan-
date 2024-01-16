import 'package:abuerdan2/core/widgets/custom_drawer.dart';
import 'package:abuerdan2/core/widgets/floating_action_button.dart';
import 'package:abuerdan2/Features/Large_screen/presentation/views/widgets/small_screen.dart';
import 'package:abuerdan2/core/widgets/top_navigation_bar.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';

import 'core/helpers/responsiveness.dart';
import 'Features/Large_screen/presentation/views/widgets/large_screen.dart';

// ignore: non_constant_identifier_names
final GlobalKey<ScaffoldState> _Scaffoldkey = GlobalKey();

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    return Scaffold(
        key: _Scaffoldkey,
        drawer: !ResponsiveWidget.isSmallScreen(context)
            ? null
            : const CustomDrawer(),
        backgroundColor: kBackgroundcolor,
        floatingActionButton: !ResponsiveWidget.isSmallScreen(context)
            ? null
            : const FloatintActionButton(),
        body: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _controller,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const TopNavigationBar(),
            ];
          },
          body: const ResponsiveWidget(
            largeScreen: LargeScreen(),
            smallScreen: SmallScreen(),
          ),
        ));
  }
}
