import 'package:abuerdan2/Features/Comment_unaccountable/presentation/views/comment_unaaccountable.dart';
import 'package:abuerdan2/Features/Energy_consumption/presentation/views/energy_consumption.dart';
import 'package:abuerdan2/Features/Intake/presentation/views/intake_page.dart';
import 'package:abuerdan2/Features/Medication_vaccination/presentation/views/medication_vaccination.dart';
import 'package:abuerdan2/Features/Morality_culls/presentation/views/morality_culls.dart';
import 'package:abuerdan2/Features/Temperature/presentation/manager/temperature/temperature_cubit.dart';
import 'package:abuerdan2/Features/Temperature/presentation/manager/temperature/temperature_state.dart';
import 'package:abuerdan2/Features/Temperature/presentation/views/widgets/inside_house.dart';
import 'package:abuerdan2/Features/Temperature/presentation/views/widgets/outside_house.dart';
import 'package:abuerdan2/Features/Weight/presentation/views/weight_page.dart';
import 'package:abuerdan2/Features/humidity/presentation/views/humidity_page.dart';
import 'package:abuerdan2/core/Provider/text_field_provider.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class FullScreen extends StatelessWidget {
  const FullScreen({Key? key}) : super(key: key);
  static String id = 'FullScreen';
  @override
  Widget build(BuildContext context) {
    ScrollController _controller = ScrollController();
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (BuildContext context) => TemperatureCubit(),
      child: BlocConsumer<TemperatureCubit, TemperatureState>(
          listener: (BuildContext context, TemperatureState state) {},
          builder: (BuildContext context, TemperatureState state) {
            return Form(
              key: Provider.of<FormKey>(context, listen: false).formkey,
              child: ListView(
                controller: _controller,
                children: [
                  OutsideTemperature(),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                  InsideTemperature(),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 199, 198, 198),
                    height: 0,
                    indent: 1,
                    endIndent: 1,
                  ),
                  Humidity(),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 199, 198, 198),
                    height: 0,
                    indent: 1,
                    endIndent: 1,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text('Intake',
                                style: TextStyle(
                                    color: kPrimarycolor,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      IntakePage()
                    ],
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 199, 198, 198),
                    height: 0,
                    indent: 1,
                    endIndent: 1,
                  ),
                  Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text('Weight',
                                style: TextStyle(
                                    color: kPrimarycolor,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      WeightPage(),
                    ],
                  ),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 199, 198, 198),
                    height: 0,
                    indent: 1,
                    endIndent: 1,
                  ),
                  EnergyPage(),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 199, 198, 198),
                    height: 0,
                    indent: 1,
                    endIndent: 1,
                  ),
                  MedicationPage(),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 199, 198, 198),
                    height: 0,
                    indent: 1,
                    endIndent: 1,
                  ),
                  MoralityPage(),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                  const Divider(
                    thickness: 1,
                    color: Color.fromARGB(255, 199, 198, 198),
                    height: 0,
                    indent: 1,
                    endIndent: 1,
                  ),
                  CommentPage(),
                  SizedBox(height: mediaQuery.size.height * 0.07),
                ],
              ),
            );
          }),
    );
  }
}
