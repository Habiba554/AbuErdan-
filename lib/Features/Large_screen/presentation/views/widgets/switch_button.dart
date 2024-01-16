import 'package:abuerdan2/Features/Large_screen/presentation/manager/Switch/switch_screen_cubit.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SwitchButtons extends StatelessWidget {
  const SwitchButtons({
    super.key,
    required this.mediaQuery,
  });

  final MediaQueryData mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: mediaQuery.size.width * 0.004,
              top: mediaQuery.size.height * 0.01),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(20, 30),
              backgroundColor:
                  BlocProvider.of<SwitchScreenCubit>(context).currentscreen == 0
                      ? const Color(0xFF238636)
                      : kPrimarycolor,
              // Background color
            ),
            onPressed: () {
              tabsButton(context);
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.dataset,
                  size: 12,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              right: mediaQuery.size.width * 0.011,
              top: mediaQuery.size.height * 0.01),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(20, 30),
              backgroundColor:
                  BlocProvider.of<SwitchScreenCubit>(context).currentscreen == 1
                      ? const Color(0xFF238636)
                      : kPrimarycolor,
              // Background color
            ),
            onPressed: () {
              fullScreenButton(context);
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.fullscreen,
                  size: 12,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void fullScreenButton(BuildContext context) {
    BlocProvider.of<SwitchScreenCubit>(context).changeScreen();
    if (BlocProvider.of<SwitchScreenCubit>(context).currentscreen > 1) {
      BlocProvider.of<SwitchScreenCubit>(context).currentscreen--;
    }
  }

  void tabsButton(BuildContext context) {
    BlocProvider.of<SwitchScreenCubit>(context).changeScreen2();
    if (BlocProvider.of<SwitchScreenCubit>(context).currentscreen >= 1) {
      BlocProvider.of<SwitchScreenCubit>(context).currentscreen = 0;
    }
  }
}
