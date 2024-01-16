import 'package:abuerdan2/Features/Medication_vaccination/presentation/views/widgets/medication.dart';
import 'package:flutter/material.dart';
import 'widgets/vaccination.dart';

// ignore: must_be_immutable
class MedicationPage extends StatelessWidget {
  MedicationPage({super.key});
  final ScrollController _controller = ScrollController();
  final TextEditingController _medication = TextEditingController();
  final TextEditingController _medicationBirds = TextEditingController();
  final TextEditingController _vaccination = TextEditingController();
  final TextEditingController _vaccinationBirds = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Medication(
            medication: _medication,
            medicationBirds: _medicationBirds,
          ),
          SizedBox(height: mediaQuery.size.height * 0.03),
          const Divider(
            thickness: 1,
            color: Color.fromARGB(255, 199, 198, 198),
            height: 0,
            indent: 1,
            endIndent: 1,
          ),
          SizedBox(height: mediaQuery.size.height * 0.03),
          Vaccination(
              screenHeight: screenHeight,
              screenWidth: screenWidth,
              vaccination: _vaccination,
              vaccinationBirds: _vaccinationBirds,
              mediaQuery: mediaQuery)
        ],
      ),
    );
  }
}
