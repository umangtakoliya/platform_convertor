import 'package:flutter/material.dart';

import '../Model/datetimemodel.dart';

class datetimeprovider extends ChangeNotifier {
  DateTimemodel dateTimeModel = DateTimemodel(initialdate: DateTime.now());
  timemodal Timemodal = timemodal(initialtime: TimeOfDay.now());

  void pickdate(DateTime n) {
    dateTimeModel.initialdate = n;
    notifyListeners();
  }

  void picktime(TimeOfDay n) {
    Timemodal.initialtime = n;
    notifyListeners();
  }
}