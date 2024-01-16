import 'package:abuerdan2/Features/humidity/presentation/views/widgets/humidity.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'widgets/co2_page.dart';

// ignore: must_be_immutable
class Humidity extends StatelessWidget {
  Humidity({super.key});
  final TextEditingController _cO1 = TextEditingController();
  final TextEditingController _cO2 = TextEditingController();
  final TextEditingController _cO3 = TextEditingController();
  final TextEditingController _humidity1 = TextEditingController();
  final TextEditingController _humidity2 = TextEditingController();
  final TextEditingController _humidity3 = TextEditingController();
  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return SingleChildScrollView(
      controller: _controller,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HumidityPage(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              humidity1: _humidity1,
              humidity2: _humidity2,
              humidity3: _humidity3,
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),
            const Divider(
              thickness: 1,
              color: Color.fromARGB(255, 199, 198, 198),
              height: 0,
              indent: 1,
              endIndent: 1,
            ),
            SizedBox(height: mediaQuery.size.height * 0.02),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Text('CO2',
                      style: TextStyle(
                          color: kPrimarycolor, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Co2Page(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              cO1: _cO1,
              cO2: _cO2,
              cO3: _cO3,
            ),
            SizedBox(height: mediaQuery.size.height * 0.04),
          ],
        ),
      ),
    );
  }
}
