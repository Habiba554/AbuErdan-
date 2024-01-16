import 'package:abuerdan2/core/Provider/text_field_provider.dart';
import 'package:abuerdan2/core/helpers/responsiveness.dart';
import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/shared/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TopNavigationBar extends StatelessWidget {
  const TopNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {},
          builder: (BuildContext context, AppStates state) {
            return SliverAppBar(
              pinned: true,
              snap: true,
              toolbarHeight: 40.0,
              floating: true,
              backgroundColor: const Color(0xFF262424),
              leading: !ResponsiveWidget.isSmallScreen(context)
                  ? null
                  : IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
              title: !ResponsiveWidget.isSmallScreen(context)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/aboErdan.png',
                              height: 20,
                              width: 20,
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'AbuErdan',
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 22.0),
                              ),
                            ),
                            const Text(
                              'Broilers Daily Data',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/aboErdan.png',
                          height: 30,
                          width: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'AbuErdan',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: mediaQuery.size.width * 0.05),
                          ),
                        ),
                      ],
                    ),
              actions: !ResponsiveWidget.isSmallScreen(context)
                  ? [
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context).datePicker(context);
                          },
                          icon: const Icon(Icons.calendar_month_outlined)),
                      TextButton(
                          onPressed: () {
                            if (Provider.of<FormKey>(context, listen: false)
                                    .formkey
                                    .currentState !=
                                null) {
                              if (Provider.of<FormKey>(context, listen: false)
                                  .formkey
                                  .currentState!
                                  .validate()) {
                                bool x = true;
                                Provider.of<FlagOfTextField>(context,
                                        listen: false)
                                    .setflag(x);
                              }
                            } else {
                              bool x = true;
                              Provider.of<FlagOfTextField>(context,
                                      listen: false)
                                  .setflag(x);
                            }
                          },
                          child: const Text(
                            'Update data',
                            style: TextStyle(color: Colors.white),
                          )),
                      IconButton(
                          onPressed: () {
                            if (Provider.of<FormKey>(context, listen: false)
                                    .formkey
                                    .currentState !=
                                null) {
                              if (Provider.of<FormKey>(context, listen: false)
                                  .formkey
                                  .currentState!
                                  .validate()) {
                                bool x = false;
                                Provider.of<FlagOfTextField>(context,
                                        listen: false)
                                    .setflag(x);
                              }
                            } else {
                              bool x = false;
                              Provider.of<FlagOfTextField>(context,
                                      listen: false)
                                  .setflag(x);
                            }
                          },
                          icon: const Icon(Icons.edit)),
                      Tooltip(
                        message: "Log out",
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.logout_outlined)),
                      ),
                    ]
                  : [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.more_vert)),
                    ],
            );
          }),
    );
  }
}
