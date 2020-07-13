import 'package:flutter/material.dart';

class ZCBottomBarItem extends BottomNavigationBarItem {
  ZCBottomBarItem(String iconName, String title) : super(
    title: Text(title),
    icon: Image.asset(
      "assets/images/tabbar/$iconName.png",
      width: 32,
      gaplessPlayback: true, /// 如果不添加会闪烁
    ),
    activeIcon: Image.asset(
      "assets/images/tabbar/${iconName}_active.png",
      width: 32,
      gaplessPlayback: true, /// 默认是false，无间隙显示播放
    ),
  );
}
