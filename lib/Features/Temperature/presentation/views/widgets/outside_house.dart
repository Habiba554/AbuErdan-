import 'package:abuerdan2/core/Provider/text_field_provider.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import '../../manager/temperature/temperature_cubit.dart';

class OutsideTemperature extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  OutsideTemperature({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(0.0),
          child: Row(
            children: [
              Icon(Icons.thermostat, color: kPrimarycolor, weight: 6.5),
              Text('Temperature',
                  style: TextStyle(
                      color: kPrimarycolor, fontWeight: FontWeight.w500))
            ],
          ),
        ),
        SizedBox(height: mediaQuery.size.height * 0.06),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Outside House',
              style: TextStyle(
                color: kPrimarycolor,
              )),
        ),
        Wrap(
          runAlignment: WrapAlignment.spaceBetween,
          spacing: screenWidth * 0.40,
          children: [
            Wrap(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Min Temp',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
                SizedBox(
                    height: 50, width: 180, child: textfieldMinTemp(context))
              ],
            ),
            Wrap(
              children: [
                const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Max Temp',
                      style: TextStyle(
                        color: Colors.black,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      height: 50, width: 180, child: textFieldMaxTemp(context)),
                )
              ],
            ),
          ],
        ),
        RangeSlider(
          inactiveColor: const Color(0xFFe8ebe9),
          activeColor: const Color(0xFF238636),
          values: RangeValues(
              BlocProvider.of<TemperatureCubit>(context).starValue1,
              BlocProvider.of<TemperatureCubit>(context).endValue1),
          min: BlocProvider.of<TemperatureCubit>(context).minValue,
          max: BlocProvider.of<TemperatureCubit>(context).maxValue,
          onChanged: (values) {
            sliderOnChange(context, values);
          },
        )
      ],
    );
  }

  TextFormField textfieldMinTemp(BuildContext context) {
    return TextFormField(
      onChanged: (values) {
        validateOnChangeMinTemp(values, context);
      },
      readOnly: Provider.of<FlagOfTextField>(context).getflag(),
      validator: (value) {
        return validateMinTemp(value, context);
      },
      maxLength: 4,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: BlocProvider.of<TemperatureCubit>(context).startController1,
      style: const TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        counterText: "",
        isDense: true,
        hintText: 'C',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimarycolor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimarycolor),
        ),
      ),
    );
  }

  TextFormField textFieldMaxTemp(BuildContext context) {
    return TextFormField(
      onChanged: (values) {
        validateOnChangeMaxTemp(values, context);
      },
      readOnly: Provider.of<FlagOfTextField>(context).getflag(),
      validator: (value) {
        return validationMaxTemp(value, context);
      },
      maxLength: 4,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: BlocProvider.of<TemperatureCubit>(context).endController1,
      style: const TextStyle(
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: const InputDecoration(
        counterText: "",
        isDense: true,
        hintText: 'C',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimarycolor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: kPrimarycolor),
        ),
      ),
    );
  }

  String? validateMinTemp(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return 'Value must be not empty';
    }
    double x = 0;
    x = double.parse(value);
    if (x > BlocProvider.of<TemperatureCubit>(context).endValue1) {
      return 'The value is greater than max temp';
    }
    return null;
  }

  void validateOnChangeMinTemp(String values, BuildContext context) {
    try {
      if (values.isNotEmpty) {
        final enteredValue = double.parse(values);
        BlocProvider.of<TemperatureCubit>(context).starValue1 = enteredValue;
        BlocProvider.of<TemperatureCubit>(context).setStartValue1();
      }
    } catch (e) {
      BlocProvider.of<TemperatureCubit>(context).starValue1 = 80.0;
      BlocProvider.of<TemperatureCubit>(context).setStartValue1();
    }
  }

  void validateOnChangeMaxTemp(String values, BuildContext context) {
    try {
      if (values.isNotEmpty) {
        final enteredValue = double.parse(values);
        BlocProvider.of<TemperatureCubit>(context).endValue1 = enteredValue;
        BlocProvider.of<TemperatureCubit>(context).setEndValue1();
      }
    } catch (e) {
      BlocProvider.of<TemperatureCubit>(context).endValue1 = 80.0;
      BlocProvider.of<TemperatureCubit>(context).setEndValue1();
    }
  }

  String? validationMaxTemp(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return 'Value must be not empty';
    }
    double x = 0;
    x = double.parse(value);
    if (x < BlocProvider.of<TemperatureCubit>(context).starValue1) {
      return 'The value is less than min temp';
    }
    if (x > BlocProvider.of<TemperatureCubit>(context).maxValue) {
      return 'The value is greater than max value';
    }
    return null;
  }

  void sliderOnChange(BuildContext context, RangeValues values) {
    if (!Provider.of<FlagOfTextField>(context, listen: false).getflag()) {
      BlocProvider.of<TemperatureCubit>(context).starValue1 =
          values.start.roundToDouble();
      BlocProvider.of<TemperatureCubit>(context).endValue1 =
          values.end.roundToDouble();
      BlocProvider.of<TemperatureCubit>(context).startController1.text =
          values.start.roundToDouble().toString();
      BlocProvider.of<TemperatureCubit>(context).endController1.text =
          values.end.roundToDouble().toString();
      BlocProvider.of<TemperatureCubit>(context).initState();
      BlocProvider.of<TemperatureCubit>(context).setEndValue1();
      BlocProvider.of<TemperatureCubit>(context).setStartValue1();
    }
  }
}
