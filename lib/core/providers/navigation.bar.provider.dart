import 'package:flutter/material.dart';

class NavigationBarProvider extends ChangeNotifier {
  int currentPage = 0;

  void onChangeCurrentPage(int index) {
    currentPage = index;
    notifyListeners();
  }
}
