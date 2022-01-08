import 'package:flutter/material.dart';

enum SheetState { basic, invisible, full }

class FlyBtmSheetController extends ChangeNotifier {
  SheetState sheetState = SheetState.basic;

  void changeSheetState(SheetState state) {
    sheetState = state;

    notifyListeners();
  }
}
