import 'package:abuerdan2/core/Provider/text_field_provider.dart';
import 'package:abuerdan2/core/shared/cubit.dart';
import 'package:abuerdan2/core/shared/states.dart';
import 'package:abuerdan2/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class FloatintActionButton extends StatelessWidget {
  const FloatintActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, AppStates state) {},
          builder: (BuildContext context, AppStates state) {
            return FloatingActionButton(
                onPressed: () {
                  if (Provider.of<FlagOfTextField>(context, listen: false)
                      .flagTextfiled!) {
                    Provider.of<FlagOfTextField>(context, listen: false)
                        .setflag(true);
                    AppCubit.get(context).changeIcon(
                        isShow: false, icons: Icons.edit, context: context);
                  } else {
                    if (Provider.of<FormKey>(context, listen: false)
                            .formkey
                            .currentState !=
                        null) {
                      if (Provider.of<FormKey>(context, listen: false)
                          .formkey
                          .currentState!
                          .validate()) {
                        Provider.of<FlagOfTextField>(context, listen: false)
                            .setflag(false);
                        AppCubit.get(context).changeIcon(
                            isShow: true, icons: Icons.save, context: context);
                        AppCubit.get(context).flag = true;
                      }
                    } else {
                      Provider.of<FlagOfTextField>(context, listen: false)
                          .setflag(false);
                      AppCubit.get(context).changeIcon(
                          isShow: true, icons: Icons.save, context: context);
                      AppCubit.get(context).flag = true;
                    }
                  }
                },
                backgroundColor: kPrimarycolor,
                child: Icon(Provider.of<FlagOfTextField>(context).flagTextfiled!
                    ? Icons.edit
                    : Icons.save));
          }),
    );
  }
}
