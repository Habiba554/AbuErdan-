import 'package:abuerdan2/Features/Comment_unaccountable/presentation/views/comment_unaaccountable.dart';
import 'package:abuerdan2/Features/Energy_consumption/presentation/views/energy_consumption.dart';
import 'package:abuerdan2/Features/Full_screen/presentation/views/full_screen.dart';
import 'package:abuerdan2/Features/Intake/presentation/views/intake_page.dart';
import 'package:abuerdan2/Features/Large_screen/presentation/manager/Switch/switch_screen_cubit.dart';
import 'package:abuerdan2/Features/Medication_vaccination/presentation/views/medication_vaccination.dart';
import 'package:abuerdan2/Features/Morality_culls/presentation/views/morality_culls.dart';
import 'package:abuerdan2/Features/Temperature/presentation/views/temperature_page.dart';
import 'package:abuerdan2/Features/Weight/presentation/views/weight_page.dart';
import 'package:abuerdan2/Features/humidity/presentation/views/humidity_page.dart';
import 'package:abuerdan2/core/widgets/custom_tab_bar.dart';
import 'package:abuerdan2/core/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangeScreenOncondition extends StatelessWidget {
  const ChangeScreenOncondition({
    super.key,
    required ScrollController controller1,
  }) : _controller1 = controller1;

  final ScrollController _controller1;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: BlocProvider.of<SwitchScreenCubit>(context).currentscreen == 0
          ? DefaultTabController(
              length: 8,
              child: NestedScrollView(
                physics: const ScrollPhysics(),
                controller: _controller1,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    const CustomTabBar(
                      tabs: [
                        Tab(
                          text: 'Temperature',
                        ),
                        Tab(
                          text: "Text",
                        ),
                        Tab(text: "Intake"),
                        Tab(text: "Weight"),
                        Tab(
                          text: "Text",
                        ),
                        Tab(
                          text: "Text",
                        ),
                        Tab(text: "Text"),
                        Tab(text: "Text"),
                      ],
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TemperaturePage(),
                    ),
                    Humidity(),
                    Center(child: IntakePage()),
                    WeightPage(),
                    Center(child: EnergyPage()),
                    MedicationPage(),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: MoralityPage(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: CommentPage(),
                    ),
                  ],
                ),
              ),
            )
          : const FullScreen(),
    );
  }
}
