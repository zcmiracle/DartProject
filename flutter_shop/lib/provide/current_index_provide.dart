import 'package:flutter/material.dart';

// 切换底部导航栏
class CurrentIndexProvide with ChangeNotifier {

  // 首页 分页 购物车 我的
  int currentIndex = 0;
  changeIndex(int newIndex) {
    currentIndex = newIndex;
    notifyListeners();
  }

}