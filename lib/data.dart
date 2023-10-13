import 'package:flutter/material.dart';

class Data extends ChangeNotifier {
  int count = 0;

  Increment() {
    count++;
    if (count == 10) {
      count = 0;
    }
    notifyListeners();
  }

}
