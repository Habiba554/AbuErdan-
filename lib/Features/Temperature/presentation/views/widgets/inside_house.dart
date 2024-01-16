// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:abuerdan2/core/Provider/text_field_provider.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../manager/temperature/temperature_cubit.dart';

class InsideTemperature extends StatelessWidget {
  InsideTemperature({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Inside House',
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
            //SizedBox(width: screenWidth*0.1,),
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
                      height: 50, width: 180, child: textfieldMaxTemp(context)),
                )
              ],
            ),
          ],
        ),
        RangeSlider(
          inactiveColor: const Color(0xFFe8ebe9),
          activeColor: const Color(0xFF238636),
          values: RangeValues(
              BlocProvider.of<TemperatureCubit>(context).starValue2,
              BlocProvider.of<TemperatureCubit>(context).endValue2),
          min: BlocProvider.of<TemperatureCubit>(context).minValue,
          max: BlocProvider.of<TemperatureCubit>(context).maxValue,
          onChanged: (values) {
            sliderOnChange(context, values);
          },
        ),
      ],
    );
  }

  TextFormField textfieldMaxTemp(BuildContext context) {
    return TextFormField(
      onChanged: (values) {
        onChangeMaxTemp(values, context);
      },
      readOnly: Provider.of<FlagOfTextField>(context).getflag(),
      validator: (value) {
        return validateMaxTemp(value, context);
      },
      maxLength: 4,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}')),
      ],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.number,
      textAlign: TextAlign.center,
      controller: BlocProvider.of<TemperatureCubit>(context).endController2,
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

  TextFormField textfieldMinTemp(BuildContext context) {
    return TextFormField(
      onChanged: (values) {
        onChnageMinTemp(values, context);
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
      controller: BlocProvider.of<TemperatureCubit>(context).startController2,
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

  void sliderOnChange(BuildContext context, RangeValues values) {
    if (!Provider.of<FlagOfTextField>(context, listen: false).getflag()) {
      BlocProvider.of<TemperatureCubit>(context).starValue2 =
          values.start.roundToDouble();
      BlocProvider.of<TemperatureCubit>(context).endValue2 =
          values.end.roundToDouble();
      BlocProvider.of<TemperatureCubit>(context).startController2.text =
          values.start.roundToDouble().toString();
      BlocProvider.of<TemperatureCubit>(context).endController2.text =
          values.end.roundToDouble().toString();
      BlocProvider.of<TemperatureCubit>(context).initState();
      BlocProvider.of<TemperatureCubit>(context).setEndValue2();
      BlocProvider.of<TemperatureCubit>(context).setStartValue2();
    }
  }

  String? validateMaxTemp(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return 'Value must be not empty';
    }
    double x = 0;
    x = double.parse(value);
    if (x < BlocProvider.of<TemperatureCubit>(context).starValue2) {
      return 'The value is less than min temp';
    }
    if (x > BlocProvider.of<TemperatureCubit>(context).maxValue) {
      return 'The value is greater than max value';
    }
    return null;
  }

  void onChangeMaxTemp(String values, BuildContext context) {
    try {
      if (values.isNotEmpty) {
        final enteredValue = double.parse(values);
        BlocProvider.of<TemperatureCubit>(context).endValue2 = enteredValue;
        BlocProvider.of<TemperatureCubit>(context).setEndValue2();
      }
    } catch (e) {
      BlocProvider.of<TemperatureCubit>(context).endValue2 = 80.0;
      BlocProvider.of<TemperatureCubit>(context).setEndValue2();
    }
  }

  String? validateMinTemp(String? value, BuildContext context) {
    if (value!.isEmpty) {
      return 'Value must be not empty';
    }
    double x = 0;
    x = double.parse(value);
    if (x > BlocProvider.of<TemperatureCubit>(context).endValue2) {
      return 'The value is greater than max temp';
    }
    return null;
  }

  void onChnageMinTemp(String values, BuildContext context) {
    try {
      if (values.isNotEmpty) {
        final enteredValue = double.parse(values);
        BlocProvider.of<TemperatureCubit>(context).starValue2 = enteredValue;
        BlocProvider.of<TemperatureCubit>(context).setStartValue2();
      }
    } catch (e) {
      BlocProvider.of<TemperatureCubit>(context).starValue2 = 0.0;
      BlocProvider.of<TemperatureCubit>(context).setStartValue2();
    }
  }
}
