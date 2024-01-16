import 'package:flutter/cupertino.dart';

class SideBarBody extends ChangeNotifier {
  int body = 0;
  int color = 0;
  void setBody(int b) {
    body = b;
    notifyListeners();
  }

  int getBody() {
    return body;
  }

  void setcolor(int c) {
    color = c;
    notifyListeners();
  }

  int getcolor() {
    return color;
  }
}
