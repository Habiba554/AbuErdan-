import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/side_bar_provider.dart';
import 'custom_elevatedbutton.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      // shadowColor: Colors.black,
      backgroundColor: kSideBar,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 20,
                ),
                Text(
                  'Administration',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(height: mediaQuery.size.height * 0.08),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 199, 198, 198),
            height: 0,
            indent: 15,
            endIndent: 15,
          ),
          SizedBox(height: mediaQuery.size.height * 0.03),
          CustomElevatedButton(
            onpress: () {},
            text: 'Pre-cycle Deliveries',
            bodyNum: 0,
          ),
          CustomElevatedButton(
            onpress: () {},
            text: 'Pre-cycle Consumptions',
            bodyNum: 0,
          ),
          CustomElevatedButton(
            onpress: () {
              Provider.of<SideBarBody>(context, listen: false).setBody(1);
              Provider.of<SideBarBody>(context, listen: false).setcolor(1);
              Navigator.pop(context);
            },
            text: 'Medication Deliveries',
            bodyNum: 1,
          ),
          CustomElevatedButton(
            onpress: () {
              Provider.of<SideBarBody>(context, listen: false).setBody(2);
              Provider.of<SideBarBody>(context, listen: false).setcolor(2);
              Navigator.pop(context);
            },
            text: 'Energy Deliveries',
            bodyNum: 2,
          ),
          CustomElevatedButton(
            onpress: () {
              Provider.of<SideBarBody>(context, listen: false).setBody(3);
              Provider.of<SideBarBody>(context, listen: false).setcolor(3);
              Navigator.pop(context);
            },
            text: 'Vaccination Deliveries',
            bodyNum: 3,
          ),
          CustomElevatedButton(
            onpress: () {
              Navigator.pop(context);
            },
            text: 'OtherType Deliveries',
            bodyNum: 4,
          ),
          CustomElevatedButton(
            onpress: () {
              Navigator.pop(context);
            },
            text: 'Log out',
            bodyNum: 4,
          ),
        ],
      ),
    );
  }
}
