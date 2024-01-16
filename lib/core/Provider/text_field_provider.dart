import 'package:flutter/material.dart';

class FlagOfTextField extends ChangeNotifier {
  bool? flagTextfiled = true;

  void setflag(bool? flag) {
    flagTextfiled = flag;
    notifyListeners();
  }

  bool getflag() {
    return flagTextfiled!;
  }
}

class FormKey extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey();
  //GlobalKey<FormState> formkey2 = GlobalKey();
}
