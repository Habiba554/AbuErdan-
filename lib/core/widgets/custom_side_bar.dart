import 'package:abuerdan2/core/helpers/responsiveness.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../Provider/side_bar_provider.dart';
import '../shared/cubit.dart';
import '../shared/states.dart';
import 'custom_elevatedbutton_icon.dart';
import 'custom_size_box.dart';

// ignore: must_be_immutable
class SideBar extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey expansionTileKey = GlobalKey();
  final GlobalKey expansionTileKey1 = GlobalKey();
  double? previousOffset;

  void _scrollToSelectedContent(
      bool isExpanded, double? previousOffset, int index, GlobalKey myKey) {
    final keyContext = myKey.currentContext;

    if (keyContext != null) {
      // make sure that your widget is visible
      final box = keyContext.findRenderObject() as RenderBox;
      _scrollController.animateTo(
          isExpanded ? (box.size.height * index) : previousOffset!,
          duration: const Duration(milliseconds: 500),
          curve: Curves.linear);
    }
  }

  SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {},
          builder: (BuildContext context, AppStates state) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Container(
                color: kSideBar, //Color(0xFF023659),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  controller: _scrollController,
                  children: [
                    Container(
                      height: screenHeight * 0.15,
                      color: kSideBar,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: screenWidth * 0.015,
                          ),
                          Text(
                            'Administration',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.015),
                          )
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 199, 198, 198),
                      height: 0,
                      indent: 1,
                      endIndent: 1,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: screenWidth * 0.03,
                          minWidth: screenWidth * 0.1),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Wrap(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pre-cycle Deliveries',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      !ResponsiveWidget.isMediumScreen(context)
                                          ? 16
                                          : 14),
                            ), // <-- Text
                            SizedBox(
                              width: screenWidth * 0.015,
                            ),
                            Icon(
                              // <-- Icon
                              Icons.more_horiz,
                              size: screenWidth * 0.013,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kSideBar,
                            minimumSize: const Size.fromHeight(50),
                            elevation: 0.0 // NEW
                            ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 199, 198, 198),
                      height: 0,
                      indent: 1,
                      endIndent: 1,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minHeight: screenWidth * 0.03, minWidth: 16),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Wrap(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pre-cycle Consumptions',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:
                                      !ResponsiveWidget.isMediumScreen(context)
                                          ? 16
                                          : 14),
                            ), // <-- Text
                            SizedBox(
                              width: screenWidth * 0.015,
                            ),
                            Icon(
                              // <-- Icon
                              Icons.more_horiz,
                              size: screenWidth * 0.013,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kSideBar,
                            minimumSize: const Size.fromHeight(50),
                            elevation: 0.0 // NEW
                            ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 199, 198, 198),
                      height: 0,
                      indent: 1,
                      endIndent: 1,
                    ),
                    Container(
                      width: double.infinity,
                      color: AppCubit.get(context).isExpanded1
                          ? const Color(0xFF238636)
                          : kPrimarycolor,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          unselectedWidgetColor:
                              Colors.white, // here for close state
                          colorScheme: const ColorScheme.light(
                            primary: Colors.white,
                          ), // here for open state in replacement of deprecated accentColor
                          dividerColor: Colors
                              .transparent, // if you want to remove the border
                        ),
                        child: ExpansionTile(
                          key: expansionTileKey,
                          tilePadding: const EdgeInsets.only(left: 5.0),
                          onExpansionChanged: (expanding) {
                            AppCubit.get(context)
                                .changeExpansionColor1(expanding);
                            if (expanding) {
                              previousOffset = _scrollController.offset;
                              _scrollToSelectedContent(expanding,
                                  previousOffset, 0, expansionTileKey);
                            }
                          },
                          title: Container(
                            //padding: EdgeInsets.zero,
                            width: double.infinity,
                            height: mediaQuery.size.height * 0.04,
                            color: AppCubit.get(context).isExpanded1
                                ? const Color(0xFF238636)
                                : kPrimarycolor,

                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '   Alrain 1',
                                    style: TextStyle(
                                      fontSize: 16 / mediaQuery.textScaleFactor,
                                      color: kTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //trailing: Icon(Icons.arrow_drop_down),
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: AppCubit.get(context).isExpanded2
                                        ? const Color(0xFF262424)
                                        : kPrimarycolor,
                                  ),
                                  child: ExpansionTile(
                                    key: expansionTileKey1,
                                    onExpansionChanged: (bool expanding) {
                                      AppCubit.get(context)
                                          .changeExpansionColor2(expanding);
                                      if (expanding) {
                                        previousOffset =
                                            _scrollController.offset;
                                        _scrollToSelectedContent(
                                            expanding,
                                            previousOffset,
                                            0,
                                            expansionTileKey);
                                      }
                                    },
                                    //initiallyExpanded: true,
                                    title: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.zero,
                                      height: mediaQuery.size.height * 0.04,
                                      decoration: BoxDecoration(
                                        color: AppCubit.get(context).isExpanded2
                                            ? const Color(0xFF262424)
                                            : kPrimarycolor,
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Farm Deliveries',
                                              style: TextStyle(
                                                fontSize: !ResponsiveWidget
                                                        .isMediumScreen(context)
                                                    ? 16
                                                    : 13,
                                                color: kTextColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    trailing: const Icon(
                                      Icons.more_horiz,
                                      color: Colors.white,
                                    ),
                                    children: [
                                      Container(
                                          width: double.infinity,
                                          decoration: const BoxDecoration(
                                            color: kPrimarycolor,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomSizeBox(
                                                child: ElevatedButtonIcon(
                                                  onpress: () {
                                                    Provider.of<SideBarBody>(
                                                            context,
                                                            listen: false)
                                                        .setBody(1);
                                                    Provider.of<SideBarBody>(
                                                            context,
                                                            listen: false)
                                                        .setcolor(1);
                                                  },
                                                  text: 'Medication Deliveries',
                                                  bodyNum: 1,
                                                  padding: 50,
                                                ),
                                              ),
                                              CustomSizeBox(
                                                child: ElevatedButtonIcon(
                                                  onpress: () {
                                                    Provider.of<SideBarBody>(
                                                            context,
                                                            listen: false)
                                                        .setBody(2);
                                                    Provider.of<SideBarBody>(
                                                            context,
                                                            listen: false)
                                                        .setcolor(2);
                                                  },
                                                  text: 'Energy Deliveries',
                                                  bodyNum: 2,
                                                  padding: 80,
                                                ),
                                              ),
                                              CustomSizeBox(
                                                child: ElevatedButtonIcon(
                                                  onpress: () {
                                                    Provider.of<SideBarBody>(
                                                            context,
                                                            listen: false)
                                                        .setBody(3);
                                                    Provider.of<SideBarBody>(
                                                            context,
                                                            listen: false)
                                                        .setcolor(3);
                                                  },
                                                  text:
                                                      'Vaccination Deliveries',
                                                  bodyNum: 3,
                                                  padding: 55,
                                                ),
                                              ),
                                              CustomSizeBox(
                                                child: ElevatedButtonIcon(
                                                  onpress: () {
                                                    Provider.of<SideBarBody>(
                                                            context,
                                                            listen: false)
                                                        .setBody(3);
                                                    Provider.of<SideBarBody>(
                                                            context,
                                                            listen: false)
                                                        .setcolor(3);
                                                  },
                                                  text: 'OtherTypes Deliveries',
                                                  bodyNum: 4,
                                                  padding: 55,
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
