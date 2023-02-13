import 'package:flutter/material.dart';

class RunDiagnosis extends ChangeNotifier {
  bool isData = false;
  void displayData() {
    isData = true;
    notifyListeners();
  }
}
