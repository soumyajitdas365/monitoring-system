import 'dart:developer';

import 'package:flutter/material.dart';
import '../model/field_model.dart';

FieldDataProvider fieldDataProvider = FieldDataProvider();

class FieldDataProvider extends ChangeNotifier {
  bool failed = false;
  Field? field1;
  Field? field2;
  Field? field3;
  Field? field4;
  setField1Data(Field data) {
    field1 = data;
    notifyListeners();
  }

  setField2Data(Field data) {
    field2 = data;
    notifyListeners();
  }

  setField3Data(Field data) {
    field3 = data;
    notifyListeners();
  }

  setField4Data(Field data) {
    field4 = data;
    notifyListeners();
  }

  void setfailed(bool state) {
    failed = state;
    notifyListeners();
  }
}
