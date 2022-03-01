import 'package:flutter/material.dart';
import 'package:flutter_map_marker/domain/use_case/get_selected_btn.dart';

class HomeViewModel with ChangeNotifier {
  final GetSelectedBtn getSelectedBtn;

  HomeViewModel(this.getSelectedBtn);

  Future<void> selectedBtn(int btnNum) async {
    await getSelectedBtn.call(btnNum);
    notifyListeners();
  }
}
