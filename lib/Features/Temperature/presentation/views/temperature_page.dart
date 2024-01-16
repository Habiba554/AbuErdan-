import 'package:abuerdan2/Features/Temperature/presentation/views/widgets/inside_house.dart';
import 'package:abuerdan2/Features/Temperature/presentation/views/widgets/outside_house.dart';
import 'package:abuerdan2/core/Provider/text_field_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../manager/temperature/temperature_cubit.dart';
import '../manager/temperature/temperature_state.dart';

class TemperaturePage extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  TemperaturePage({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (BuildContext context) => TemperatureCubit(),
      child: BlocConsumer<TemperatureCubit, TemperatureState>(
          listener: (BuildContext context, TemperatureState state) {},
          builder: (BuildContext context, TemperatureState state) {
            return Form(
              key: Provider.of<FormKey>(context, listen: false).formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: mediaQuery.size.height * 0.03),
                  OutsideTemperature(),
                  SizedBox(height: mediaQuery.size.height * 0.03),
                  InsideTemperature(),
                ],
              ),
            );
          }),
    );
  }
}
