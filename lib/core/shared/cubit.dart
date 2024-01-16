import 'package:abuerdan2/core/shared/states.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../Provider/text_field_provider.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  bool isExpanded1 = false;
  bool isExpanded2 = false;
  int currentscreen = 0;
  bool flag = false;
  IconData icon = Icons.edit;
  String dropdownvalue = 'Default';
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Default',
  ];
  // bool flagTextfiled = false;
  // int currentStep = 0;
  // double starValue1 = 0.0;
  // double endValue1 = 80.0;
  // double starValue2 = 0.0;
  // double endValue2 = 80.0;
  // double minValue = 0.0;
  // double maxValue = 100.0;
  // GlobalKey<FormState> formkey = GlobalKey();
  // final startController1 = TextEditingController(text: '0.0');
  // final endController1 = TextEditingController(text: '80.0');
  // final startController2 = TextEditingController(text: '0.0');
  // final endController2 = TextEditingController(text: '80.0');
  // void initState() {
  //   startController1.addListener(setStartValue1);
  //   startController1.text = starValue1.toStringAsFixed(1);
  //   endController1.addListener(setEndValue1);
  //   endController1.text = endValue1.toStringAsFixed(1);
  //   startController2.addListener(setStartValue2);
  //   startController2.text = starValue2.toStringAsFixed(1);
  //   endController2.addListener(setEndValue2);
  //   endController2.text = endValue2.toStringAsFixed(1);
  //   flagTextfiled = false;
  //   emit(AppInitialState());
  // }

  // void setStartValue1() {
  //   try {
  //     if (startController1.text.isNotEmpty) {
  //       if (double.parse(startController1.text).roundToDouble() <=
  //               double.parse(endController1.text).roundToDouble() &&
  //           double.parse(startController1.text).roundToDouble() >= minValue &&
  //           double.parse(endController1.text).roundToDouble() >= minValue &&
  //           double.parse(startController1.text).roundToDouble() <= maxValue &&
  //           double.parse(endController1.text).roundToDouble() <= maxValue) {
  //         starValue1 = double.parse(startController1.text).roundToDouble();
  //         emit(AppChangeStartValue());
  //       }
  //     }
  //   } catch (e) {
  //     starValue1 = 0.0;
  //     emit(AppChangeStartValue());
  //   }
  // }

  // void setEndValue1() {
  //   try {
  //     if (endController1.text.isNotEmpty) {
  //       if (double.parse(startController1.text).roundToDouble() <=
  //               double.parse(endController1.text).roundToDouble() &&
  //           double.parse(startController1.text).roundToDouble() >= minValue &&
  //           double.parse(endController1.text).roundToDouble() >= minValue &&
  //           double.parse(startController1.text).roundToDouble() <= maxValue &&
  //           double.parse(endController1.text).roundToDouble() <= maxValue) {
  //         endValue1 = double.parse(endController1.text).roundToDouble();
  //         emit(AppChangeEndValue());
  //       }
  //     }
  //   } catch (e) {
  //     endValue1 = 80.0;
  //     emit(AppChangeEndValue());
  //   }
  // }

  // void setStartValue2() {
  //   try {
  //     if (startController2.text.isNotEmpty) {
  //       if (double.parse(startController2.text).roundToDouble() <=
  //               double.parse(endController2.text).roundToDouble() &&
  //           double.parse(startController2.text).roundToDouble() >= minValue &&
  //           double.parse(endController2.text).roundToDouble() >= minValue &&
  //           double.parse(startController2.text).roundToDouble() <= maxValue &&
  //           double.parse(endController2.text).roundToDouble() <= maxValue) {
  //         starValue2 = double.parse(startController2.text).roundToDouble();
  //         emit(AppChangeStartValue());
  //       }
  //     }
  //   } catch (e) {
  //     starValue2 = 0.0;
  //     emit(AppChangeStartValue());
  //   }
  // }

  // void setEndValue2() {
  //   try {
  //     if (endController2.text.isNotEmpty) {
  //       if (double.parse(startController2.text).roundToDouble() <=
  //               double.parse(endController2.text).roundToDouble() &&
  //           double.parse(startController2.text).roundToDouble() >= minValue &&
  //           double.parse(endController2.text).roundToDouble() >= minValue &&
  //           double.parse(startController2.text).roundToDouble() <= maxValue &&
  //           double.parse(endController2.text).roundToDouble() <= maxValue) {
  //         endValue2 = double.parse(endController2.text).roundToDouble();
  //         emit(AppChangeEndValue());
  //       }
  //     }
  //   } catch (e) {
  //     endValue2 = 80.0;
  //     emit(AppChangeEndValue());
  //   }
  // }

  // void dispose() {
  //   // Clean up the controller when the widget is removed from the widget tree.
  //   // This also removes the _printLatestValue listener.
  //   startController1.dispose();
  //   endController1.dispose();
  //   startController2.dispose();
  //   endController2.dispose();
  //   dispose();
  //   emit(AppDispose());
  // }

  // void onTap(value) {
  //   currentStep = value;
  //   emit(AppOnTap());
  // }

  // void stepContinue() {
  //   currentStep++;
  //   emit(AppStepContinue());
  // }

  // void stepBack() {
  //   currentStep--;
  //   emit(AppStepBack());
  // }

  void changeIcon({required bool isShow, required IconData icons, context}) {
    Provider.of<FlagOfTextField>(context, listen: false).flagTextfiled = isShow;
    icon = icons;
    emit(AppChangeIcon());
  }

  var key = GlobalKey<ScaffoldState>();
  ScaffoldState? gets() {
    return key.currentState;
  }

  // void changeScreen() {
  //   currentscreen++;
  //   emit(AppChangeScreen());
  // }

  // void changeScreen2() {
  //   emit(AppChangeScreen());
  // }

  void changeExpansionColor1(bool ex) {
    isExpanded1 = ex;
    emit(AppChangeExpansionColor());
  }

  void changeExpansionColor2(bool ex) {
    isExpanded2 = ex;
    emit(AppChangeExpansionColor());
  }

  // void changeFlagTextfield() {
  //   flagTextfiled = true;
  //   emit(AppChangeflag());
  // }

  void datePicker(context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.parse("2030-05-01"),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: kPrimarycolor, // <-- SEE HERE
                onPrimary: Colors.white, // <-- SEE HERE
                onSurface: kPrimarycolor, // <-- SEE HERE
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: kPrimarycolor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        });
    emit(AppShowDatePicker());
  }

  IconData changeIconss(context) {
    if (flag == true &&
        Provider.of<FlagOfTextField>(context).getflag() == false) {
      return icon = Icons.save;
    } else {
      return icon = Icons.edit;
    }
  }
}
