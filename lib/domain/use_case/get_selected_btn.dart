import 'package:flutter_map_marker/presentation/components/datas/appbar_btn_data.dart';

class GetSelectedBtn {
  final AppBarBtnData appBarBtnData;

  GetSelectedBtn(this.appBarBtnData);

  Future<void> call(int btnNum) async {
    for (int i = 0; i < appBarBtnData.appBarBtnDatas.length; i++) {
      if (i == btnNum) {
        appBarBtnData.appBarBtnDatas[i].btnState = true;
      } else {
        appBarBtnData.appBarBtnDatas[i].btnState = false;
      }
    }
  }
}
