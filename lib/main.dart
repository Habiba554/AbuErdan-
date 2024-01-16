import 'package:abuerdan2/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'Features/Large_screen/presentation/manager/Switch/switch_screen_cubit.dart';
import 'Features/Temperature/presentation/manager/temperature/temperature_cubit.dart';
import 'core/Provider/text_field_provider.dart';
import 'core/Provider/side_bar_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SideBarBody>(
          create: (context) => SideBarBody(),
        ),
        ChangeNotifierProvider<FlagOfTextField>(
          create: (context) => FlagOfTextField(),
        ),
        ChangeNotifierProvider<FormKey>(
          create: (context) => FormKey(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => TemperatureCubit()),
          BlocProvider(create: (context) => TemperatureCubit()),
          BlocProvider(create: (context) => SwitchScreenCubit()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Screen(),
        ),
      ),
    );
  }
}
