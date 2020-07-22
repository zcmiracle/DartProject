import 'package:flutter/material.dart';
import '../model/details/details_model.dart';

class DetailsInfoProvide with ChangeNotifier {
  DetailModel goodsInfo;
  bool isLeft = true;
  bool isRight = false;

  /// 改变tabBar的状态
  changeLeftAndRight(String changeState) {
    if (changeState == 'left') {
      isLeft = true;
      isRight = false;
    } else {
      isLeft = false;
      isRight = true;
    }
    notifyListeners();
  }
}