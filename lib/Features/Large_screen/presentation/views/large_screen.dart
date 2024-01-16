import 'package:abuerdan2/Features/Energy_deliveries/presentation/views/energy_delivery_page.dart';
import 'package:abuerdan2/Features/Large_screen/presentation/manager/Switch/switch_screen_cubit.dart';
import 'package:abuerdan2/Features/Vaccination_deliveries/presentation/views/vaccination_delivery_page.dart';
import 'package:abuerdan2/Features/medication_deliveries/presentation/views/medication_delivery_page.dart';
import 'package:abuerdan2/core/Provider/side_bar_provider.dart';
import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'widgets/change_screen.dart';
import 'widgets/switch_button.dart';

class CustomLargeScreen extends StatelessWidget {
  const CustomLargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    ScrollController _controller1 = ScrollController();
    ScrollController _controller2 = ScrollController();
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<SwitchScreenCubit, SwitchScreenState>(
          listener: (BuildContext context, SwitchScreenState state) {},
          builder: (BuildContext context, SwitchScreenState state) {
            return SingleChildScrollView(
              controller: _controller2,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  if (Provider.of<SideBarBody>(context).getBody() == 1) ...[
                    CustomContainer(child: Medicationss()),
                  ] else if (Provider.of<SideBarBody>(context).getBody() ==
                      2) ...[
                    CustomContainer(child: const Energyss()),
                  ] else if (Provider.of<SideBarBody>(context).getBody() ==
                      3) ...[
                    CustomContainer(child: const Vaccinationss()),
                  ] else ...[
                    SwitchButtons(mediaQuery: mediaQuery),
                    ChangeScreenOncondition(controller1: _controller1),
                  ]
                ],
              ),
            );
          }),
    );
  }
}
