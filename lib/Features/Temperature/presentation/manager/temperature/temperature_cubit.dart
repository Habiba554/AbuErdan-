
import 'package:abuerdan2/Features/Temperature/presentation/manager/temperature/temperature_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TemperatureCubit extends Cubit<TemperatureState> {
  TemperatureCubit() : super(TemperatureInitial());
  bool flagTextfiled = false;
  double starValue1 = 0.0;
  double endValue1 = 80.0;
  double starValue2 = 0.0;
  double endValue2 = 80.0;
  double minValue = 0.0;
  double maxValue = 100.0;
  final startController1 = TextEditingController(text: '0.0');
  final endController1 = TextEditingController(text: '80.0');
  final startController2 = TextEditingController(text: '0.0');
  final endController2 = TextEditingController(text: '80.0');

  void initState() {
    startController1.addListener(setStartValue1);
    startController1.text = starValue1.toStringAsFixed(1);
    endController1.addListener(setEndValue1);
    endController1.text = endValue1.toStringAsFixed(1);
    startController2.addListener(setStartValue2);
    startController2.text = starValue2.toStringAsFixed(1);
    endController2.addListener(setEndValue2);
    endController2.text = endValue2.toStringAsFixed(1);
    flagTextfiled = false;

    emit(TemperatureInitial());
  }

  void setStartValue1() {
    try {
      if (startController1.text.isNotEmpty) {
        if (double.parse(startController1.text).roundToDouble() <=
                double.parse(endController1.text).roundToDouble() &&
            double.parse(startController1.text).roundToDouble() >= minValue &&
            double.parse(endController1.text).roundToDouble() >= minValue &&
            double.parse(startController1.text).roundToDouble() <= maxValue &&
            double.parse(endController1.text).roundToDouble() <= maxValue) {
          starValue1 = double.parse(startController1.text).roundToDouble();
          emit(TemperatureChangeStartValue());
        }
      }
    } catch (e) {
      starValue1 = 0.0;
      emit(TemperatureChangeStartValue());
    }
  }

  void setEndValue1() {
    try {
      if (endController1.text.isNotEmpty) {
        if (double.parse(startController1.text).roundToDouble() <=
                double.parse(endController1.text).roundToDouble() &&
            double.parse(startController1.text).roundToDouble() >= minValue &&
            double.parse(endController1.text).roundToDouble() >= minValue &&
            double.parse(startController1.text).roundToDouble() <= maxValue &&
            double.parse(endController1.text).roundToDouble() <= maxValue) {
          endValue1 = double.parse(endController1.text).roundToDouble();
          emit(TemperatureChangeEndValue());
        }
      }
    } catch (e) {
      endValue1 = 80.0;
      emit(TemperatureChangeEndValue());
    }
  }

  void setStartValue2() {
    try {
      if (startController2.text.isNotEmpty) {
        if (double.parse(startController2.text).roundToDouble() <=
                double.parse(endController2.text).roundToDouble() &&
            double.parse(startController2.text).roundToDouble() >= minValue &&
            double.parse(endController2.text).roundToDouble() >= minValue &&
            double.parse(startController2.text).roundToDouble() <= maxValue &&
            double.parse(endController2.text).roundToDouble() <= maxValue) {
          starValue2 = double.parse(startController2.text).roundToDouble();
          emit(TemperatureChangeStartValue());
        }
      }
    } catch (e) {
      starValue2 = 0.0;
      emit(TemperatureChangeStartValue());
    }
  }

  void setEndValue2() {
    try {
      if (endController2.text.isNotEmpty) {
        if (double.parse(startController2.text).roundToDouble() <=
                double.parse(endController2.text).roundToDouble() &&
            double.parse(startController2.text).roundToDouble() >= minValue &&
            double.parse(endController2.text).roundToDouble() >= minValue &&
            double.parse(startController2.text).roundToDouble() <= maxValue &&
            double.parse(endController2.text).roundToDouble() <= maxValue) {
          endValue2 = double.parse(endController2.text).roundToDouble();
          emit(TemperatureChangeEndValue());
        }
      }
    } catch (e) {
      endValue2 = 80.0;
      emit(TemperatureChangeEndValue());
    }
  }

  void changeFlagTextfield() {
    flagTextfiled = true;
    emit(TemperatureChangeflag());
  }

  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    startController1.dispose();
    endController1.dispose();
    startController2.dispose();
    endController2.dispose();
    dispose();
    emit(TemperatureDispose());
  }
}
