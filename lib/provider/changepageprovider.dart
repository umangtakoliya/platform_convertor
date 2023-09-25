import 'package:flutter/material.dart';

import '../model/indexmodel.dart';


class ChangeIndexProvider extends ChangeNotifier {
  ChangePageIndex changePageIndex = ChangePageIndex(index: 0);

  void ChangeIndex({required int val}) {
    changePageIndex.index = val;
    notifyListeners();
  }
}