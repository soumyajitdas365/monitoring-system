import 'dart:developer';

import 'package:flutter/material.dart';
import '../model/field_model.dart';

FieldDataProvider fieldDataProvider = FieldDataProvider();

class FieldDataProvider extends ChangeNotifier {
  Field? field1;
  setFieldData(Field data) {
    field1 = data;
    notifyListeners();
  }
}
