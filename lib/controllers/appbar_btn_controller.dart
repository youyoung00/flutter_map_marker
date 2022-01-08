import 'package:flutter/material.dart';

enum topBtnState { onFly, onShop, onEat }

class AppBarBtnController extends ChangeNotifier {
  topBtnState isBtnState = topBtnState.onFly;

  void changeBtnState(topBtnState state) {
    isBtnState = state;

    notifyListeners();
  }
}
